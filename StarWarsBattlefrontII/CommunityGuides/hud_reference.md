Guide by ReSharpshooter
original posting: https://www.gametoast.com/viewtopic.php?f=27&t=14579

# **Hud Configs**

***Basics that you need to know***

Hud files are located in data\_MOD\common\hud and 1playerhud.hud is used for the pc version. Also make sure you modify the one in the hud\pc folder. Hud files are munged into the ingame.lvl. Meshes (.msh) used by the hud are found in common\mshs. 


***Hud elements***

Several things make up basic hud elements− groups, models, and text. There are many other specific ones, mainly dealing with health bars, mini maps, and objectives, but we’ll stick to the basics.

**Groups**

The most general element is the group. The group is a group of hud elements like models and text. It is as follows:

```C#
Group("player1weaponinformation") // name of group
{
    PropagateAlpha(1)
    Viewport(1)
    Position(0.000000, 1.00000, 0.000000, "Viewport") // position of group
    ZOrder(255) // the order in which it’s drawn on top of others
    EventEnable("player1.weaponsEnable") // when it will appear
    EventDisable("player1.weaponsDisable") // when it will disappear
  
   //Here in the group goes models and/or text.
}
```

**Models**

A model is a msh file that will be displayed on the screen:
```C#
    Model3D("player1weapon1backdrop") // name of model
    {
        Mesh("hud_weapon_backdrop") // name of the msh file that is found in common/mshs/
        Viewport(1)
        Position(0.00000, 0.000000, -2.212803, "Viewport") // transformations, note that you can leave out any of these if you don’t need them. 
        Rotation(0.804269, 90.747269, 359.999695)
        Scale(0.27000, 0.26000, 0.260000)
        ZOrder(8)
        EventEnable("player1.spawn")
        EventDisable("player1.die")
    }
```

Therefore it is possible to add/modify hud elements by utilizing these components. 

A quick list of known hud elements:

hud\_weapon\_backdrop – the weapon backdrops in the lower left hand corner.

**Text**

I really don’t use any text, but it looks simple enough. Most parameters look self-explanatory if you ever wished to use text.

```C#
Text("player1weapon1overheat")
{
    TextBreak("Word")
    TextStyle("Shadow")
    Text("game.weaponOverheat") // points to localized string
    TextAlignment("Center", "Top")
    TextFont("gamefont_medium")
    Position(0.500000, 0.750000, 0.000000, "Viewport")
    ZOrder(5)
    Color(230, 70, 0)
    ColorPulseRate(0.750000)
    FadeInTime(0.250000)
    FadeHoldTime(0.100000)
    FadeOutTime(1.000000)
    EventEnable("player1.weaponsOverheat")
    EventDisable("player1.weaponsDisable")
}
```

***Hud icons***

The hud icon for a weapon is a little bit different. The model for player1weapon does not have a specific mesh, it takes upon whatever weapon the unit has, whether a shotgun or a rifle. Therefore, it uses an *event mesh.* For example: EventMesh("player1.weapon1.mesh") The game then uses a MeshInfo tag to specify what to do with certain meshes (such has how to position a shotgun, or how to position a rifle).

Primary weapons found in: 
```Group("player1weapon1group")```

Secondary weapons found in:
```Group("player1weapon2group")```

Format is as follows:
```C#
MeshInfo("msh_name_goes_here")
{
    Position(-0.252832, 0.341293, 0.014590, "Viewport")
    Rotation(0.804269, 90.747269, 359.999695)
    Scale(0.27000, 0.26000, 0.260000)
}
```

***Munging the hud files.***

Huds go in the ingame.lvl. Note that a complete ingame.req is found in BF2\_ModTools\data\Common not your data\_MOD folder. If you wish to create a mod map that only modifies the hud, do as follows.

Change your ingame.req in ..\data\_MOD\ to this: 

```
ucft
{
    REQN
    {
        "model"
        "any_new_msh_you_added_to_common_mshs"
        "just_list_them_all_here"
    }
    REQN
    {
        "config"
        "1playerhud"
    }
}
```
Then in your lua change it as follows:
```Lua
    ReadDataFile("ingame.lvl")
    ReadDataFile("dc:ingame.lvl") --add this part
```
After you munge it, make sure to copy the ingame.lvl 

from: **BF2\_ModTools\data\_MOD\\_LVL\_PC** 

to: **Star Wars Battlefront II\GameData\Addon\MOD\data**

