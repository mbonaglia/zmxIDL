zmxIDL
======

An IDL toolbox to communicate with ZEMAX


#### Overview


zxmIDL is an IDL library that allows IDL to communicate with ZEMAX through Windows DDE protocol. It was inspired by MZDDE Matlab toolbox.


As described in the ZEMAX EXTENSIONS section of the ZEMAX manual, ZEMAX allows to access data items via DDE.
I recommend reading the ZEMAX EXTENSIONS section of the ZEMAX manual to understand the logic!

The basic mechanism consists in sending/receiving string commands/answer to ZEMAX (e.g. "GetSurfaceData, 21, 3" to get the thickness of surface 21), so the basic brick is an IDL function (implemented in the DLM) called zemax() having as input a command string, a timeout in seconds as keyword TIMEOUT and returning a string.

At the moment only a few of the data items have been implemented in zmxIDL (actually, the ones that I needed for my ARGOS project...)
It is easy to add new ones using the available ones as templates. Feel free to ask for new features or add/modify/fix any part of the code, and inform me :-)

The library was tested on Windows XP 32 bit and Win7 64 bit, ZEMAX Nov,10 2008 and IDL 7.0 and 8.0. It is required that IDL and ZEMAX are running on the same machine.

## How to install

The source package is made of:

a) a directory "zemaxdlm" containing the files needed to build the DLL and 2 already built zemaxmodule.dll that should be ready-to-go on WinXP.

b) A set of routines z*.pro that match the commands (aka data item) . Only a few of the data item available in ZEMAX have been implemented.  

c) The zzXXX procedures, high-level interface chaining several DDE calls.

#### Howto compile the DLL


This is needed to build the DLL library zemaxmodule.dll. If you are running WinXP 32bit or Win7 64bit, the files provided in the package should be ok (hopefully...) and you can jump step 2.

0) Install a C compiler. This procedure was tested using Microsoft Visual C++ 6.0 

1) Run zemaxdlm/build_zemaxmodule.pro

The file zemaxdlm/zemaxdlm.dll should be present

2) Only if you did NOT compile and you run on a WinXP_32 or Win7_64bit: rename the file zemaxmodule32bitWinXP.dll or zemaxmodule64bitWin7.dll to zemaxmodule.dll

Go on with IDL Configuration

#### IDL Configuration


0) Add the zemaxdlm directory to IDL's DLM_PATH. On IDL7+ this is done from Window->Preferences->IDL->Paths and then selecting "DLM path" from the drop-down menu. Alternatively you can execute this commands from IDL terminal: PREF_SET, 'IDL_DLM_PATH', 'Your_zemaxdlm_path;<IDL_DEFAULT>', /COMMIT  

1) Add the zmxIDL directory to your IDL path.  On IDL7+ this is done from Window->Preferences->IDL->Paths and then selecting "IDL path"

2) Restart IDL

3) Type: "help, /DLM". In the list of the available DLMs, you should find the zemaxmodule as shown below.

** ZEMAXMODULE - IDL Extension for ZEMAX (not loaded)
    Version: 1.0, Build Date: FEB 28 2009, Source: IDL
    Path: C:\Documents and Settings\lbusoni\Documenti\adopt\idl\zmxIDL\zemaxdlm\zemaxmodule.dll


#### Test installation


0) Run ZEMAX and open a file

1) Check "Allow extensions to Push lenses" in Preferences->Editors

2) IDL> print, zemax('GetSurfaceData, 0, 3')  ; should output the thickness of the first surface 

3) IDL> zGetSurfaceData, 0, thick=thick & print, thick ; should do the same, using the routine zGetSurfaceData


#### Credits

The code was reviewed by Frederic Cassaing & Jonathan Lisowski


#### License:
The code is under the [MIT License] (http://opensource.org/licenses/MIT).


#### Contacts
Lorenzo Busoni - lbusoni@arcetri.astro.it

