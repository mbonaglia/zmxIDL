#include <stdio.h>
#include <windows.h>
#include "idl_export.h"



/* prototype for IDL_Load */
int IDL_Load( void );

/*
 * Define message codes and their corresponding printf(3) format
 * strings. Note that message codes start at zero and each one is
 * one less that the previous one. Codes must be monotonic and
 * contiguous.
 */
static IDL_MSG_DEF msg_arr[] =
{
#define M_ZMX_DDE                       0
  {  "M_ZMX_DDE",   "%NDDE error: %s" },
#define M_ZMX_ZMX                       -1  
  {  "M_ZMX_ZMX",   "%NZEMAX error: %s" },
};


/*
 * The load function fills in this message block handle with the
 * opaque handle to the message block used for this module. The other
 * routines can then use it to throw errors from this block.
 */
static IDL_MSG_BLOCK msg_block;

// DDE initialization handle
static DWORD m_idInst = 0;   
// ZEMAX conversation
static HCONV hConv;

static const char* err_descr[] = {
    "Unknown error",                      //0
    "DMLERR_ADVACKTIMEOUT",               
    "DMLERR_BUSY",                        //2
    "DMLERR_DATAACKTIMEOUT",
    "DMLERR_DLL_NOT_INITIALIZED",         //4
    "DMLERR_DLL_USAGE",                             
    "DMLERR_EXECACKTIMEOUT",              //6
    "DMLERR_INVALIDPARAMETER",
    "DMLERR_LOW_MEMORY",                  //8
    "DMLERR_MEMORY_ERROR",
    "DMLERR_NO_CONV_ESTABLISHED",         //10
    "DMLERR_NOTPROCESSED",               
    "DMLERR_POKEACKTIMEOUT",              //12
    "DMLERR_POSTMSG_FAILED",
    "DMLERR_REENTRANCY",                  //14
    "DMLERR_SERVER_DIED",
    "DMLERR_SYS_ERROR",                   //16
    "DMLERR_UNADVACKTIMEOUT",
    "DMLERR_UNFOUND_QUEUE_ID",            //18
    "DMLERR_NO_ERROR"
};

/* Implementation of the TESTPRO IDL procedure */
//static void zemaxpro(int argc, IDL_VPTR *argv)
//{
//  IDL_MessageFromBlock(msg_block, M_TM_INPRO, IDL_MSG_RET);
//}

const char* ErrorStr(UINT errcode)
{
    switch(errcode)
    {
        case DMLERR_ADVACKTIMEOUT:          return err_descr[1];
        case DMLERR_BUSY:                   return err_descr[2];
        case DMLERR_DATAACKTIMEOUT:         return err_descr[3];
        case DMLERR_DLL_NOT_INITIALIZED:    m_idInst=0;
                                            return err_descr[4];
        case DMLERR_DLL_USAGE:              return err_descr[5];
        case DMLERR_EXECACKTIMEOUT:         return err_descr[6];
        case DMLERR_INVALIDPARAMETER:       hConv=0;
                                            return err_descr[7];
        case DMLERR_LOW_MEMORY:             return err_descr[8];
        case DMLERR_MEMORY_ERROR:           return err_descr[9];
        case DMLERR_NO_CONV_ESTABLISHED:    hConv=0;
                                            return err_descr[10];
        case DMLERR_NOTPROCESSED:           return err_descr[11];
        case DMLERR_POKEACKTIMEOUT:         return err_descr[12];
        case DMLERR_POSTMSG_FAILED:         return err_descr[13];
        case DMLERR_REENTRANCY:             return err_descr[14];
        case DMLERR_SERVER_DIED:            hConv=0;
                                            return err_descr[15];
        case DMLERR_SYS_ERROR:              return err_descr[16];
        case DMLERR_UNADVACKTIMEOUT:        return err_descr[17];
        case DMLERR_UNFOUND_QUEUE_ID:       return err_descr[18];
        case DMLERR_NO_ERROR:               return err_descr[19];
        default:                            return err_descr[0];
    }
}

HDDEDATA CALLBACK DDEClientCallback(
UINT uType,       // transaction type 
UINT uFmt,        // clipboard data format 
HCONV hconv,      // handle to conversation 
HSZ hsz1,         // handle to string 
HSZ hsz2,         // handle to string 
HDDEDATA hdata,   // handle to global memory object 
DWORD dwData1,    // transaction-specific data 
DWORD dwData2)    // transaction-specific data 
{ 
    switch (uType) 
    { 
        case XTYP_REGISTER: 
        case XTYP_UNREGISTER: 
            return (HDDEDATA) NULL; 
 
        case XTYP_ADVDATA: 
            return (HDDEDATA) DDE_FACK; 
 
        case XTYP_XACT_COMPLETE: 
            // 
            return (HDDEDATA) NULL; 
 
        case XTYP_DISCONNECT: 
            // 
            return (HDDEDATA) NULL; 
 
        default: 
            return (HDDEDATA) NULL; 
    } 
} 



UINT initialize()
{
    UINT ret;
    
    if(m_idInst!=0) return DMLERR_NO_ERROR;
    
    hConv=0;
    ret=DdeInitialize(&m_idInst, (PFNCALLBACK) DDEClientCallback,
                         CBF_FAIL_EXECUTES |        // filter XTYPE_EXECUTE 
                         CBF_SKIP_ALLNOTIFICATIONS, // filter notifications
                         0);
    if (ret != DMLERR_NO_ERROR){
        m_idInst=0; 
    }
    return ret;
}

//static IDL_VPTR zemaxconnect(int argc, IDL_VPTR *argv)
HCONV zemaxconnect()
{
    HSZ hszServName; 
    HSZ hszTopic; 
    
    if(hConv == 0) {
        ////////////// connect to zemax
        hszServName = DdeCreateStringHandle( 
          m_idInst,         // instance identifier 
          "ZEMAX",          // string to register 
          CP_WINANSI);      // Windows ANSI code page 
 
        hszTopic = DdeCreateStringHandle( 
          m_idInst,         // instance identifier 
          "DontCare",       // System topic 
          CP_WINANSI);      // Windows ANSI code page 
    
        hConv =  DdeConnect(m_idInst, hszServName, hszTopic, NULL);
        //if(hConv==0) IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_RET, ErrorStr(DdeGetLastError(m_idInst)));
    }
    return hConv;
}

static void zemaxdisconnect(int argc, IDL_VPTR *argv)
{
    BOOL ret;
    // close conversation
    ret = DdeDisconnect(hConv);
    //if(ret==0) IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_LONGJMP, ErrorStr(DdeGetLastError(m_idInst)));
    hConv=0;

    //uninitialize dde
    ret =DdeUninitialize(m_idInst);
    //if(ret==0) IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_LONGJMP, "Could not uninitialize dde library");
    m_idInst=0;

}



static IDL_VPTR zemax(int argc, IDL_VPTR *argv, char* argk)
{	
    typedef struct {  
        IDL_KW_RESULT_FIRST_FIELD;   // Must be first entry in this structure  
        double timeout;  
    } KW_RESULT;  
    static IDL_KW_PAR kw_pars[] = { //Lexically sorted! 
        { "TIMEOUT"  , IDL_TYP_DOUBLE, 1, 0, 0, (char*)IDL_KW_OFFSETOF(timeout) },  
        { NULL, 0, 0, 0, NULL, NULL }  
    };  
    
    HDDEDATA        hddedata;
    DWORD           dwTimeout;
    HSZ             hszItem;
    char            szBuffer[5000];
    //char            szMsg[256]; //TODO DELETE
    DWORD           dwChars; 
    char*           szCmd;
    UINT            ret;
    KW_RESULT       kw;

    kw.timeout = 5.0;  
    (void) IDL_KWProcessByOffset(argc, argv, argk, kw_pars, NULL, 1, &kw); 
    dwTimeout = (DWORD) (kw.timeout * 1000);
    IDL_KW_FREE;
    
    
    ///////
    szCmd = IDL_VarGetString(argv[0]);

    // inizialize DDE if needed
    ret = initialize(); 
    if (ret != DMLERR_NO_ERROR) IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_LONGJMP, ErrorStr(ret));
    // create DDE conversation if needed
    zemaxconnect();
    if(hConv==0) IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_LONGJMP, ErrorStr(DdeGetLastError(m_idInst)));

    ////////////////// dai comando /////////
    hszItem =  DdeCreateStringHandle( 
      m_idInst,         // instance identifier 
      szCmd, // System topic 
      CP_WINANSI);    // Windows ANSI code page 

    hddedata = DdeClientTransaction(      
        NULL,            //LPBYTE pData,
        0,               //DWORD cbData,
        hConv,           //HCONV hConv,
        hszItem,         //HSZ hszItem,
        CF_TEXT,         //UINT wFmt,
        XTYP_REQUEST,    //UINT wType,
        dwTimeout,       //DWORD dwTimeout,
        NULL             //LPDWORD pdwResult
    );
    DdeFreeStringHandle(m_idInst, hszItem); 
    if(!hddedata) {
      //MessageBox(NULL, szBuffer, "no transazione", MB_OK);
      IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_LONGJMP, ErrorStr(DdeGetLastError(m_idInst)));
      return IDL_StrToSTRING("pippo");
    }
    else
    {
      //MessageBox(NULL, szBuffer, "transazione", MB_OK);
      dwChars = DdeGetData(hddedata,NULL,256,0);
      dwChars = DdeGetData(hddedata,szBuffer,dwChars,0);
      //if ((ret = DdeGetLastError(m_idInst)) != DMLERR_NO_ERROR)
      //      IDL_MessageFromBlock(msg_block, M_ZMX_DDE, IDL_MSG_RET, ErrorStr(DdeGetLastError(m_idInst)));
      
      szBuffer[strlen(szBuffer)-2]='\0';   // get rid of \r\n at the end of the returned string
    }

    return IDL_StrToSTRING(szBuffer);
}

/*
static IDL_VPTR zemaxraytrace(int argc, IDL_VPTR *argv, char* argk)
{	
    typedef struct {  
        IDL_KW_RESULT_FIRST_FIELD;   // Must be first entry in this structure  
        double timeout;  
    } KW_RESULT;  
    static IDL_KW_PAR kw_pars[] = { //Lexically sorted! 
        { "TIMEOUT"  , IDL_TYP_DOUBLE, 1, 0, 0, (char*)IDL_KW_OFFSETOF(timeout) },  
        { NULL, 0, 0, 0, NULL, NULL }  
    };  
    
    DWORD           dwTimeout;
    KW_RESULT       kw;
    char            szBuffer[5000];

    kw.timeout = 1.0;  
    (void) IDL_KWProcessByOffset(argc, argv, argk, kw_pars, NULL, 1, &kw); 
    dwTimeout = (DWORD) (kw.timeout * 1000);
    IDL_KW_FREE;
    
    return IDL_StrToSTRING(szBuffer);
} */  

int IDL_Load(void)
{
  /*
   * These tables contain information on the functions and procedures
   * that make up the TESTMODULE DLM. The information contained in these
   * tables must be identical to that contained in zemax.dlm.
   */
  static IDL_SYSFUN_DEF2 function_addr[] = {
    { zemax, "ZEMAX", 1, IDL_MAXPARAMS, IDL_SYSFUN_DEF_F_KEYWORDS , 0 },
  };

  static IDL_SYSFUN_DEF2 procedure_addr[] = {
    { (IDL_FUN_RET) zemaxdisconnect, "ZDDECLOSE", 0, 0, 0, 0},
  };


  /*
   * Create a message block to hold our messages. Save its handle where
   * the other routines can access it.
   */
  if (!(msg_block = IDL_MessageDefineBlock("Zemax",
					   IDL_CARRAY_ELTS(msg_arr), msg_arr)))
    return IDL_FALSE;

  /*
   * Register our routine. The routines must be specified exactly the same
   * as in zemax.dlm.
   */
  return IDL_SysRtnAdd(function_addr, TRUE, IDL_CARRAY_ELTS(function_addr))
     && IDL_SysRtnAdd(procedure_addr, FALSE, IDL_CARRAY_ELTS(procedure_addr));
}
