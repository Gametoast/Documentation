## Star Wars Battlefront II (2005) Lua

#### About versions 
It should be noted that Lua 4 and Lua 5 are quite different. SWBF (2004) uses Lua 4.0.1 SWBFII (2005) uses Lua 5.0.2.

### Folder Contants
This folder contains binaries of Luac.exe (the Lua compiler) and Lua.exe (the Lua interpreter) version 5.0.2. 


When selecting a binary file on GitHub, you should see a 'Download' button available to download the file when you browse to it.

It is easiest to use Lua.exe by feeding it a file to run like this:
```
C:\> lua.exe MyFile.lua 
```
The Lua.exe program can also run programs and files compiled by the 'Luac.exe' program.

Lhe Luac.exe program ships with the modtools and is used by the 'ScriptMunge' program to compile lua files for Star Wars Battlefront II (2005).

Use the -h option to learn more about these programs.
```
C:\MyFolder>Lua.exe -h
usage: Lua.exe [options] [script [args]].
Available options are:
  -        execute stdin as a file
  -e stat  execute string `stat'
  -i       enter interactive mode after executing `script'
  -l name  load and run library `name'
  -v       show version information
  --       stop handling options

```

```
C:\MyFolder>luac.exe -h
Luac.exe: unrecognized option `-h'
usage: Luac.exe [options] [filenames].  Available options are:
  -        process stdin
  -l       list
  -o name  output to file `name' (default is "luac.out")
  -p       parse only
  -s       strip debug information
  -v       show version information
  --       stop handling options
```

Of Particular interest is the -l option, which lists out the lua code and can be used to decompile compiled lua files.

See Video here: https://youtu.be/Rkl5RiRWu9Q


Lua 5.0 manual: https://www.lua.org/manual/5.0/

Lua license: https://www.lua.org/license.html
