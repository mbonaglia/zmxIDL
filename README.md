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

## What's inside

The source package is made of:

a) a directory "zemaxdlm" containing the files needed to build the DLL and 2 already built zemaxmodule.dll that should be ready-to-go on WinXP.

b) A set of routines z*.pro that match the commands (aka data item) . Only a few of the data item available in ZEMAX have been implemented.  

c) The zzXXX procedures, high-level interface chaining several DDE calls.

d) a directory "test" used for sofware unittest. It is meant to be used only by zmxIDL developers.

e) the ZEMAX manual in pdf


## How to install

0) Run IDL 

1) cd into the zmxIDL directory `cd, 'C:\blahbah\....\zmxIDL'` 

2) at IDL prompt type `install` and follow instructions

3) exit and restart IDL

4) at IDL prompt type `test_install` and follow instructions



#### Test installation


0) Run ZEMAX and open a file

1) Check "Allow extensions to Push lenses" in Preferences->Editors

2) IDL> print, zemax('GetSurfaceData, 0, 3')  ; should output the thickness of the first surface 

3) IDL> zGetSurfaceData, 0, thick=thick & print, thick ; should do the same, using the routine zGetSurfaceData


#### Credits

The code was reviewed by Marco Bonaglia, Frederic Cassaing & Jonathan Lisowski


#### License:
The code is under the [MIT License] (http://opensource.org/licenses/MIT).


#### Contacts
Lorenzo Busoni - lbusoni@arcetri.astro.it

