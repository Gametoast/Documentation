SWBF Mod Tools

**FLYTHROUGH MOVIES FOR STAR WARS BATTLEFRONT**

VIDEO ASSET DEVELOPMENT AND COMPRESSION:  
Star Wars Battlefront flythroughs, the short video clip showcasing the level in the map select screen, are captured and edited as .avi�s and then compressed into .bik�s using Bink Video by RAD Game Tools INC. The flythroughs are titled using the naming convention of �map1fly.bik� where �map1� is the name of the map. The .bik�s are following the recommended compression guidelines listed on the Rad Game Tools website at: [http://www.radgametools.com/binkhcwb.htm](http://www.radgametools.com/binkhcwb.htm). These guidelines are a helpful reference, but of course results will vary depending on the content makeup of the video clip. Experimentation to achieve the delicate balance of good image quality at a low file size is the name of the game.

As a starting point, here are the settings used on average for the flythroughs on Star Wars Battlefront:

Overall data rate settings: Compress to a data rate (bytes) of 750000  
Keep peak data rate under a multiple of the overall data rate 3.0  
No scaling compression  
How many frames to preview during bandwidth allocation: 12  
Width: 640  
Height: 480  
Contrast: 8  
Smooth %: 3  
Deinterlace: On  

SCRIPTING TO INCORPORATE INTO THE GAME SHELL:  
The next step is to get the .bik file into the shell of the game.

First, go to the folder of where the movie assets are contained:

Downloadable content\\DataTAT3\\\_SOURCE\_PC\\Shell\\Movies

This directory contains the .bik movie and a .mlst text file. For example  
Tat3fly.bik  
Tat3.mlst

Place the flythrough movie in this directory and create a .mlst text file. The .mlst text file is titled the map name with a .mlst extension, for example, �tat3.mlst�. This is a text file that simply has one line of text:

..\\..\\\_SOURCE\_PC\\shell\\movies\\tat3fly.bik

Second, go to another directory that contains the scripting file for how the movie should behave:

Downloadable content\\DataTAT3\\Shell\\Movies

This directory contains .mcfg text files. The .mcfg text file is titled the map name with a .mcfg file extension, for example, �tat3.mcfg�. This is a text file that has a few lines of scripting:

```C#
// transition times used by all movies

MovieProperties()
{
    Name("flythrough\_template");
    FadeInTime(1.0);
    FadeOutTime(1.0);
}

// Level fly throughs...
// TAT3
MovieProperties()
{
    Name("tat3fly");
    Inherit("flythrough\_template");
    Movie("tat3");
    SegmentList()
    {
        Segment("tat3fly", 1.0, -1);
    }
}
```
These are all the components used in creating and displaying your flythrough to accompany your map in the shell of the map select screen.