##Star Wars Battlefront (2004) Lua

#### About versions 
It should be noted that Lua 4 and Lua 5 are quite different. SWBF (2004) uses Lua 4.0.1 SWBFII (2005) uses Lua 5.0.2.


This folder contains binaries of Luac.exe (the Lua compiler) and Lua.exe (the Lua interpreter) version Lua 4.0.1. 


When selecting a binary file on GitHub, you should see a 'Download' button available to download the file when you browse to it.

It is easiest to use Lua.exe by feeding it a file to run like this:
```
C:\> lua.exe MyFile.lua 
```
The Lua.exe program can also run programs and files compiled by the 'Luac.exe' program.

The Luac.exe program ships with the modtools and is used by the 'ScriptMunge' program to compile lua files for Star Wars Battlefront (2004).

Use the -h option to learn more about these programs.
```
C:\MyFolder>lua.exe -h
usage: lua [options].  Available options are:
  -        execute stdin as a file
  -c       close Lua when exiting
  -e stat  execute string `stat'
  -f name  execute file `name' with remaining arguments in table `arg'
  -i       enter interactive mode with prompt
  -q       enter interactive mode without prompt
  -sNUM    set stack size to NUM (must be the first option)
  -v       print version information
  a=b      set global `a' to string `b'
  name     execute file `name'

```

```
C:\MyFolder>luac.exe -h
luac: unrecognized option `-h'
usage: luac [options] [filenames].  Available options are:
  -        process stdin
  -l       list
  -o file  output file (default is "luac.out")
  -p       parse only
  -s       strip debug information
  -t       test code integrity
  -v       show version information

```

Of Particular interest is the -l option, which lists out the lua code and can be used to decompile compiled lua files. 

Lua 4.0 manual: https://www.lua.org/manual/4.0/

Lua license: https://www.lua.org/license.html