# Making Mods in Star Wars Battlefront II

So you&#39;ve just picked yourself up a copy of Battlefront II, and want to make some new content…sit and relax, you&#39;ve come to the right place. This document will guide you through the process of creating new maps in Battlefront II using the new Visual Munge program which we&#39;ve specifically designed for the would-be Battlefront II modders out there.

ModTools VisualMunge.exe is a re-designed version of the tool that we used in creating Battlefront II, re-designed to make the process of creating a new mod directory, and setting up your new map as simple as a few mouse clicks. This eliminates the 30 or 40 steps that we had to take when creating new maps while actually working on the game, so we hope you enjoy it. And now the fun begins….

### Directory Structure

First, unzip your BF2\_ModTools zip file into the root of your C: drive. We can&#39;t be held responsible should you put it somewhere else, and things don&#39;t work, so just take our advice…this is where you want to put your BF2 Mod Tools files. Inside, you&#39;ll find the following folders:

**\BF2\_ModTools\assets**

This folder contains many of the original assets from Battlefront II, many of which you&#39;ll need to copy into your mod directory manually if you wish to make mods using these files. Don&#39;t worry, this will all be explained later. _Note: it would be wise not to directly edit these files without copying them into your mod folder first. Keep these as the original data_

**\BF2\_ModTools\data**

This folder contains most of the files actually needed to make a working level mod in Battlefront II. These files will be copied to your new mod folder (which ModTools VisualMunge will create, this will also be explained later) **DO NOT MODIFY ANY FILES IN THIS FOLDER**. VisualMunge will create a copy of this database, and there will be the files that you&#39;ll want to modify.

**\BF2\_ModTools\documentation**

You guessed it. This folder contains many useful documents which will help you along your way to creating some nifty Battlefront II mods. Be sure to check out these docs as they will certainly be helpful when endeavoring to create some spiffy new Battlefront II content. Many of the game&#39;s systems are documented in these files.

**\BF2\_ModTools\TEMPLATE**

This folder contains the template files that VisualMunge uses to create your new world. The game mode, world files, and script files are stored here. Again…. **DO NOT MODIFY ANY FILES IN THIS FOLDER**

**\BF2\_ModTools\ToolsFL**

A bunch of tools related files that you don&#39;t have to worry too much about in creating new levels for Battlefront II.

Under the root of the mod tools folder, you&#39;ll find the EULA (End User Licensing Agreement), Readme.txt, and a file called **jedi side example.zip.** This file contains some reference files useful for looking at how to create a new side for your mod (more on this in **BF2 Jedi Creation.doc.**

### ModTools VisualMunge – Creating your new world

To begin, browse to your \BF2\_ModTools\data\_BUILD folder, and run the program called ModTools VisualMunge.exe

The first time you run ModTools VisualMunge.exe, it will try to automatically detect your Battlefront II install folder. If it fails to auto-detect, you&#39;ll get a pop-up dialog asking you to enter your Battlefront II directory. The dialog will look like this:

![](RackMultipart20220212-4-1ry6aw9_html_fc59938a98c0787d.jpg)

If this popup should rear it&#39;s ugly head, simply browse to your \Star Wars Battlefront II\GameData directory, and click ok. It is very important that VisualMunge knows this path, as this is where your mod data will be copied to for being run in the game.

Once that it all taken care of, and out of the way, here is an image of the interface you should now be looking at:

![](RackMultipart20220212-4-1ry6aw9_html_d8b40f696d37302f.jpg)

The first thing you&#39;ll need to do to put you on the path of getting your very own Battlefront II map up and running, and choose a 3-letter name for your mod. I&#39;ll use ABC as the example for this document. _Note: the 3-letter name thing is unfortunately required by many systems in the game, so this was something we were unable to change._

Once you&#39;ve entered a 3-letter world name, you&#39;ll need to enter a Full World Name, and a World Description for your new map. The Full World Name and World Description are what will show up in the shell when you go to select your new map to play it.

Now that that&#39;s all our of the way, all that&#39;s left to do, is check the boxes for the game modes you want to include on your new map (the choices are Conquest, 2-flag CTF, 1-flag CTF, and Hero Assault) and click &quot;Create World&quot;.

What this has now done, is create a mod directory under your BF2\_ModTools directory for your new mod. So if, for example, you were to create a world called ABC, you will now find a **data\_abc** directory in your BF2\_ModTools folder. All the files from **\data** have been copied into your new folder, and the files in **\TEMPLATE** have been modified, and renamed automatically, and placed in your mod directory to create your new map according to the options you specified.

Once VisualMunge is done working it&#39;s magic (copying and modifying files) you&#39;ll get a pop-up message that looks like this:

![](RackMultipart20220212-4-1ry6aw9_html_74627ffe4f1246e9.jpg)

This means that all the copying, and modifying is done, and you&#39;ll now need to:

1. Close VisualMunge,
2. Browse to **\BF2ModTools\data\_abc\_Build**
3. Run ModTools VisualMunge.exe from inside this folder.

This is very important. The steps I just outlined are the only time that you&#39;ll run VisualMunge from the main **\data** directory. Once you&#39;ve created your new level, you&#39;ll run VisualMunge from inside your **\data\_abc\_BUILD** mod folder, which VisualMunge has created for you. Always be sure that you&#39;re running VisualMunge from the correct folder, to avoid problems. To make things at least somewhat foolproof, you&#39;ll notice that the **Munge** options have been grayed out when you run VisualMunge from the main data folder, and conversely, the **Create New World** options are grayed out when you run VisualMunge from inside your new mod folder.

### ModTools VisualMunge – Munging and running your new world

The term &quot;munge&quot; is the term that we use for basically compiling your data for use in the game. We&#39;ll get to actually modifying your new world in a bit, first I&#39;m going to cover munging, and running your new level in the game.

So, by now you should have opened VisualMunge from inside your new mod folder, and you&#39;ll notice that all the **Munge** options have been enabled, and the **Create World** options _disabled_. Your new level will automatically show up in the **Worlds** drop-down menu, and the only other option that should be selected by default is **Common**. You can leave everything as is when you run the program. _Note: you MUST have your world selected in the worlds list in order for everything to munge and copy correctly._

Click **Munge**.

Once VisualMunge finishes working it&#39;s magic, you&#39;re all done. You have a level that you can run, and play in the game. Visual Munge copies all the necessary files for running your level into your Battlefront II folder in the following location: **\Star Wars Battlefront II\GameData\Addon\ABC** (where ABC is the 3-letter name that you gave to your level). Run the game, and your new map should show up in the Instant Action, and Multiplayer playlists.

### Template Game Modes

Here&#39;s a brief rundown of what is included when you select each game mode to be included in your new Battlefront II map:

Conquest

In Conquest, there are 4 CPs (each with spawn paths, and capture regions), 2 for each team. You can ,of course, add more CPs, and move any of the CPs and their spawn points and capture regions wherever you like.

2 Flag CTF

2 Flag CTF will have 2 CPs for each team to spawn at (these use non-capturable CPs used only as spawn points) with spawn paths included. Also included are the flags for each team, and the capture region (the cylindrical object that serves as the visual representation of the capture location) for each team.

1 Flag CTF

1 Flag CTF will have all the same things as 2 flag CTF, except there is only 1 flag placed in the middle.

Hero Assault

Hero Assault will have 4 CPs, 2 for each team (again using non-capturable CPs) and that&#39;s about it.

### Game Mode Scripts

We&#39;ve gone to the trouble of pre-arranging the scripts for each game mode, so when you select the game modes you want to include in your new map, you don&#39;t have to worry about any manual setup for the scripts. Everything is arranged for you. You can, of course, change the scripts to suit your purposes (add vehicles, additional characters if you want, etc.) The scripts will be located in **data\_ABC\common\scripts\ABC** (where ABC is the 3-letter name that you gave your map). The naming convention for the scripts is as follows:

ABCc\_con.lua – Clone wars era, Conquest

ABCg\_con.lua – Galactic Civil War era, Conquest

ABCc\_ctf.lua – Clone Wars era, 2 flag CTF

ABCg\_ctf.lua – Galactic Civil War era, 2 flag CTF

ABCc\_1flag.lua – Clone Wars era, 1 flag CTF

ABCg\_1flag.lua – Galactic Civil War era, 1 flag CTF

ABCg\_eli.lua – Hero Assault

Detailed information about the scripts can be found in the documents folder in **Lua\_scripting\_guide.doc**. Also, for a more comprehensive technical overview of LUA and it&#39;s workings in Battlefront II, check out **Battlefront2\_scripting\_system.doc**.

### Modifying your new Battlefront II level

Game scripts

You can modify the game scripts directly in any text editor (I suggest using a more advanced editor such as UltraEdit, or EditPad). See above for the location of the scripts.

Level Assets

To modify your new Battlefront II map, we&#39;ve included our proprietary level editor, **ZeroEditor**. An important note, is that you need to run ZeroEditor from your new mod directory ( **data\_abc** ) in order for things to work properly (do we see a pattern emerging here?), so browse to **data\_abc** and run zeroeditor.exe. This will load up the editor. Load up your level, and you&#39;re ready to go. For more detailed information on the workings of ZeroEditor, see **ZeroEditor\_guide.doc** in the documentation folder. We&#39;ve added tooltips to the editor for most every feature in the editor, so just hover your mouse over any of the buttons, or text in the interface, and it will pop up a tooltip explaining exactly what that feature does.

It is important to note, that when creating your new world through VisualMunge, we create, and set up all the files needed to run your level, and have the game mode functionality **work**. You _will,_ however, have to go into your world and add **Planning Paths** , **Barriers** , **Boundaries,** any **Lighting** you want to add, along with any new **Objects** or terrain features you want to add. All of these things are covered in the **ZeroEditor\_guide.doc** which is found in the documentation folder.

### Adding assets from shipped worlds to your new level

We&#39;ve packaged up the shipped worlds from Battlefront II, to allow you to use assets from the shipped game to make your new levels with. In order to use these assets you&#39;ll have to copy some files around. Below, I&#39;ll describe how to get new objects, textures, or sky files into your new map.

Adding New Objects

In order to use objects from the shipped worlds (I&#39;ll use Kashyyyk as our example here), you&#39;ll need to copy those assets from the **\BF2\_ModTools\assets\worlds\KAS\msh** and **\BF2\_ModTools\assets\worlds\KAS\odf** folders. You can copy one object at a time, or you can just copy these entire folders into your new world folder. Just keep in mind that the more files are in there, the bigger your level download will be, and the more memory will be required to run your level, so it&#39;s best not to have too many files in these folders that aren&#39;t being used. These files need to go in a corresponding folder inside your new mod folder. For example, if you want to copy some objects from the Kashyyyk world into your new world, you could either just copy the entire msh and odf folders into \data\_abc\worlds\abc\, or you can create the odf and msh folders manually, and just copy single assets over. It&#39;s important to note, that when you copy over a mesh, you need to copy over all the textures, option files (.option) and the odfs, otherwise the objects that you copy over won&#39;t work properly. (For more info on placing, and manipulating objects, see **ZeroEditor\_guide.doc** in the documents folder).

Adding New Terrain Textures

To add new textures to the terrain, just find the terrain texture you want to use in one of the shipped world assets folders, and copy it into your **\data\_abc\worlds\abc\world1\** folder. Once you&#39;ve done this, load up your map in ZeroEditor, and open your map. Click on the **Texture** edit mode button, and you&#39;ll see your list of textures on the right hand side. Select a box that you want to add a new texture to (you can replace existing textures, or you can start by adding a new texture to a blank box). You&#39;ll see the texture name appear on the left side where it says **Texture**. The box will be blank if you choose a blank texture slot. Click the **Browse** button below the **Texture** box, browse to the texture you just copied into your world folder, and voila…your new texture is ready to be used. (For more info on using the texture painting tools, see **ZeroEditor\_guide.doc** in the documents folder).

Changing the Default Sky

By default, the template map uses the sky file from Yavin. Changing this is a fairly simple thing to do. Browse to the world that you want to use the sky file from (again, I&#39;ll use Kashyyyk as our example) in **\BF2\_ModTools\assets\worlds\KAS\world2** and copy the sky file (kas2.sky) into your mod worlds folder ( **\data\_abc\worlds\abc\world1** ) and rename it to abc.sky (where abc is the 3-letter name that you gave your world when you first created it). Open up that sky file, and search for which assets are used by the sky file, and you&#39;ll need to copy those assets into your mod level&#39;s world folder ( **\data\_abc\worlds\abc\world1** ). They will be a/some sky .msh files, and some textures. Only worry about files that are actually located in the assets\worlds\KAS\world2 folder. If there are files that the sky file is looking for that aren&#39;t located there, then don&#39;t worry about those.

### Adding new CPs to your map

Since most of you will want to have more than just the 4 default CPs in conquest, here is a quick tutorial on how to add more CPs to your map.

The key things that every CP needs in Conquest:

SpawnPath – This is where you will spawn if you select this CP

CaptureRegion – The region that you need to be inside in order to capture the CP

ControlRegion – This region controls vehicle spawns, more on this later

The first thing you need to do is open the editor, and open your new world. Continuing with the example of ABC, go to **\BF2\_ModTools\data\_abc\** and run zeroeditor.exe from here. Once the editor is loaded, click the **LOAD** button, and browse to your map ( **\BF2\_MofTools\data\_abc\worlds\ABC\world1\ABC.wld** )

The first thing you&#39;ll see when you go to load up your map is the **Load Layers** dialog. For the sake of keeping things clean, and simple, always click **Select All** and make sure all the layers are loaded. You can hide layers later if you want to, but it&#39;s best if they are all always loaded.

As an aside, there is a checkbox at the bottom called **Build accurate object collision**. What this does, is builds auto-generated collision for all the objects, based on the actual mesh. I would recommend using this, as it makes placing, selecting, and manipulating objects MUCH easier. Otherwise, the editor will use a bounding box for collision which makes selecting objects a pain, and it makes placing objects on top of other objects much more difficult.

Once you&#39;ve clicked **Select All** and check the box to build accurate object collision, click **OK.**

Now, at the top-middle of the screen, you&#39;ll see a section called **Active Layer** , with a button underneath it that says **CHANGE**. Click that button, and it will take you into the layers dialog. Click on conquest and then close that window.

Now you&#39;re going to want to go into Object edit mode.

Click on the **Object** edit mode button.

On the left side of the screen, you&#39;ll see:

![](RackMultipart20220212-4-1ry6aw9_html_23a894f4e70088b0.jpg)

Click the **Browse** button. Browse to the following location: **\BF2\_ModTools\data\_abc\common\odfs** , and select **com\_bldg\_controlezone**

The browse dialog will automatically close, and you be back in your editor view. Drag your mouse around the 3D view, and notice there is now a small object that is always under your mouse cursor. This is the CP object. Simply click on a spot on the terrain and it will place a new CP object in your level.

Now that the CP is placed, we need to set up the name of the CP, and a few other things like what spawn path it will use, and what capture region it will use.

Click on the **Select** button on the upper-left part of the Object edit panel. Move your mouse cursor over the CP object you just placed, and you&#39;ll see it turns **green** when the mouse cursor is over it. Click on it, and it will turn **blue**. This means the CP is now selected.

Now that you have the CP selected, we need to change it&#39;s name. I recommend keeping with the naming scheme that we used in the template files, so your new CP should be named **cp5** (as we already have CPs 1 through 4 that were automatically placed when you created your level). I also recommend always using **lower case** in anything you type in any of these fields, just because it eliminates the possibility of having mis-matched capitalization across associated objects.

So let&#39;s name this CP, cp5. Simply click on the auto-generated name in the **name** field, which will highlight the name, type your new name, and hit **enter**.

Next, click on the **0** in the **Team** field, enter a 1, or 2, and hit enter. This makes this CP belong to team 1, or 2, whichever you select, at the beginning of the match.

The **Label** field isn&#39;t really important, so you can just leave it blank.

Notice also, that once the CP is selected, you&#39;ll notice some new information has appeared in the **Object Instance** box on the right side of the Zero interface.

![](RackMultipart20220212-4-1ry6aw9_html_b8495b3b9491a525.gif)

The fields we want to modify are the **CaptureRegion, ControlRegion,** and **SpawnPath** fields **.**

In the **CaptureRegion** field, enter cp5\_capture

In the **ControlRegion** field, enter cp5\_control

In the **SpawnPath** field, enter cp5\_spawn

_Note: The_ _ **CaptureRegion** _ _is the region that you need to be standing in in order to capture the CP. The_ _ **ControlRegion** _ _is a region that controls the spawning of vehicles associated with a CP. Vehicle Spawns are placed_ _ **inside** _ _the Control Region, and once they leave the Control Region, if they are abandoned, they will eventually self-destruct, and respawn._

Repeat the above process with however many CPs you want to add to your map. Continue the naming scheme of cp6, cp6, etc. And make sure to use cp6\_capture, cp6\_control, etc. You can, if you like, start some CPs on team **0**. This will make them **Neutral** at the beginning of the match. You need to have at least one CP start team 1, and team 2 at the beginning so the teams both have an initial CP to spawn in at.

Now that you have your CPs in your level, with all the appropriate namings, and associations set up, we&#39;ll move on to creating the spawn paths, and capture/control regions.

On the **Edit Mode** toolbar, click on the **Region** button. Notice the interface has changed slightly to show the region editing tools.

On the left side of the Zero Editor interface, you&#39;ll now see the following tool panel:

F ![](RackMultipart20220212-4-1ry6aw9_html_40f62a0e08713302.jpg) irst, click on the **New Group** button. Then click on the **Cylinder** button under the **Shape** section. This will allow you to place a cylindrical region in your level. As with Object Mode, simply move your cursor to where you want to place your region (the regions should be placed in the same location as the CP that they are going to be used for), and left-click.

Once your region is placed in the world, click on **Select Region** under the **Action** section. Move your cursor over the region you just placed and click on it to select it.

You&#39;ll notice that just as with objects, a name is automatically filled in, in the **Region ID** boxes.

At the top of the screen, next to the _top_ **Region ID** box (there are 2 Region ID boxes, one on the tool panel as you can see in the image on the left, and one at the top of the screen to the right of the tool panel) there is a box titled **Class Properties.** I know this is confusing, but _this_ is where you need to type the name of your region (I know it&#39;s weird, but trust me, it works  )

Click in the **Class Properties** box, and enter the name &quot;cp5\_capture&quot; (without the quotes). You should then copy that name into the **Region ID** box to avoid any confusion later on. It will also make the region easier to select from it&#39;s Region ID in the list.

Now that you have the region created, you&#39;ll want to move it so that it is centered over cp5 that we created earlier. To move a region, select it, as described above, and hold the **C** key. You&#39;ll see a set of axis appear on the object. One red, green, and blue. While you&#39;re holding the **C** key, you can move the region by using the **Left Mouse Button** to move on the X-axis (red), the **Right Mouse Button** to move on the Y-axis(green), and **Middle Mouse Button** to move up and down on the Z-axis (blue). Position the region so that it is centered over **cp5** and sunken slightly into the ground to make sure there are no places you could stand and have your feet not be inside the region.

That&#39;s that. Now when a unit enters this region, they will begin capturing the CP.

The next thing we&#39;re going to do, is create the Control Region for this CP.

First, click on **New Group** in the region tool panel. This time, we&#39;re going to make a box region, so under Shape, click **Box.**

Now just click where you want to place the region. _Note: It should also be slightly sunken into the terrain_

Select the region (click on **Select Region** and then click to select) and enter the name &quot;cp2\_control&quot; into the **Class Properties** and **Region ID** fields, the same as we did on the Capture Region.

Now we&#39;re going to need to scale the region up a bit. The region should already be selected. Press and hold the **Z** key. You&#39;ll see a set of axis identical to the ones that you saw when moving objects, and regions. But now, the Left, Middle, and Right mouse buttons will **scale** the region on each axis. Scale the region up about twice as big as it is to begin with. On the X and Y axis, while leaving the height the same. Center this new region over the CP as well.

Now, you have a cylindrical **Capture Region** and a rectangular **Control Region.** The Control Region is used for vehicle spawns, which I&#39;ll explain later on.

Now that we have our CPs set up, and the capture and control regions in place, we&#39;ll need to place our spawn points so that we can spawn in at our new CPs.

First, click on the **Path** button under Edit Modes. You&#39;ll see a new panel on the right that looks like this:

(insert pic)

First, click **New Path**. The first thing we&#39;ll do is rename the path to &quot;cp5\_spawn&quot;. To do this, click on the auto-generated name in the **Path Name** box, and type &quot;cp5\_spawn&quot; (no quotes) and hit enter.

Now, to place path points, just click on the terrain where you want to place your node. Each CP should have at least 6 or 8 spawn points. Click on the terrain, and place 6 nodes on the ground around cp5.

Notice that there are a set of axis visible on each path node. There is a blue, red and green axis. Players will spawn into the world facing in the direction of the **green** axis. To rotate this axis, first click on the **Move** button under the Action tab, and then click on the node you want to rotate.

Once you have the node selected, press and hold the **X** key to go into rotate mode. Click and drag with your **Middle Mouse Button** to rotate the green axis into the position that you want players to face when they spawn in. Repeat this process for each node.

Just to keep everything all in one place, I&#39;ll go over quickly how to make your new CPs actually count in conquest. You&#39;ll need to open up your **abcc\_con.lua** and **abcg\_con.lua** which is located in **\BF2\_ModTools\data\_abc\common\scripts\ABC\**. At the top you&#39;ll see this function:

function ScriptPostLoad()

--This defines the CPs. These need to happen first

cp1 = CommandPost:New{name = &quot;cp1&quot;}

cp2 = CommandPost:New{name = &quot;cp2&quot;}

cp3 = CommandPost:New{name = &quot;cp3&quot;}

cp4 = CommandPost:New{name = &quot;cp4&quot;}

--This sets up the actual objective. This needs to happen after cp&#39;s are defined

conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF,

textATT = &quot;game.modes.con&quot;,

textDEF = &quot;game.modes.con2&quot;,

multiplayerRules = true}

--This adds the CPs to the objective. This needs to happen after the objective is set up

conquest:AddCommandPost(cp1)

conquest:AddCommandPost(cp2)

conquest:AddCommandPost(cp3)

conquest:AddCommandPost(cp4)

conquest:Start()

EnableSPHeroRules()

end

All you have to do to get your new CPs working in conquest, is to add entries for cp5, cp6, etc…for however many CPs you add to your level. So let&#39;s say you added cp5 and cp6. You&#39;re new ScriptPostLoad function will look like this (I&#39;ve put in bold the additions that I made):

function ScriptPostLoad()

--This defines the CPs. These need to happen first

cp1 = CommandPost:New{name = &quot;cp1&quot;}

cp2 = CommandPost:New{name = &quot;cp2&quot;}

cp3 = CommandPost:New{name = &quot;cp3&quot;}

cp4 = CommandPost:New{name = &quot;cp4&quot;}

**cp5 = CommandPost:New{name = &quot;cp5&quot;}**

**cp6 = CommandPost:New{name = &quot;cp6&quot;}**

--This sets up the actual objective. This needs to happen after cp&#39;s are defined

conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF,

textATT = &quot;game.modes.con&quot;,

textDEF = &quot;game.modes.con2&quot;,

multiplayerRules = true}

--This adds the CPs to the objective. This needs to happen after the objective is set up

conquest:AddCommandPost(cp1)

conquest:AddCommandPost(cp2)

conquest:AddCommandPost(cp3)

conquest:AddCommandPost(cp4)

**conquest:AddCommandPost(cp5)**

**conquest:AddCommandPost(cp6)**

conquest:Start()

EnableSPHeroRules()

end

…and that&#39;s it. You&#39;re new CPs are now functional. _Note: if you don&#39;t make these changes to your script, you&#39;re new CPs will show up just fine in the game, and will be capturable, but they will not contribute to the conquest functionality, meaning that if CPs 1-4 are all captured, the game will still end even if CPs 5 and 6 haven&#39;t been. Get it?_

### CPs for CTF and Hero Assault

For CTF and Hero assault instead of using the object **com\_bldg\_controlzone** , which is meant for conquest CPs, you&#39;ll use(from the same directory) **com\_bldg\_controlzone\_CTF**. The rest of the process is the same, except these CPs do not need capture regions (and in fact should never _have_ capture regions). In fact, control regions are only needed if you are going to have vehicle spawns associated with that CP. The only requirements are the name, team, and spawnpath has to be set properly. CPs in CTF (1 flag and 2 flag) and Hero Assault are **ONLY** used as spawn points, and will not be capturable.

### A note about layers

**Be sure that you select the proper Layer when you add CPs, or any other objects to your level.**

If, for example, you are in the **ctf** layer, and you are trying to place CPs for **conquest** , you&#39;re going to get new CPs showing up in CTF, and no new CPs in conquest. So always be mindful of which layer you are currently editing. Objects, regions, paths, etc, that are placed in any of the game mode layers (conquest, ctf, 1flag, or eli) will only show up in that game mode. If you want objects to show up in all game modes, you can either create a new layer (which by default will show up in all game modes) or you can just add these objects to the **Base** layer.

See **ZeroEditor\_GameModes.doc** for more info about layers and game modes.

### Vehicle Spawns

In this section I&#39;ll go over (as promised) the process of adding a vehicle into your map.

Open Zero Editor, and open your map. (Remember to run zero editor from inside your mod directory, **\BF2\_ModTools\data\_ABC\zeroeditor.exe** )

The first thing you need to understand about adding vehicles to your level is that all vehicles are added with the **same object** in the editor. With that in mind, let&#39;s continue. 

First, you&#39;ll need to go to **Object** edit mode. Once in object edit mode, click on **Browse** as pictured below:

![](RackMultipart20220212-4-1ry6aw9_html_23a894f4e70088b0.jpg)

This will open the browse window. Browse to **\BF2\_ModTools\data\_ABC\common\odfs\com\_item\_vehicle\_spawn.odf**

Once you select this object, you will be brought back to the Object edit mode. To place the vehicle spawn, click on **Place** and simply click on the terrain where you want to place your vehicle spawn. You should now have an object in your level that looks like this:

![](RackMultipart20220212-4-1ry6aw9_html_8e148b67a962553c.jpg)

This is your vehicle spawn. The arrow indicates which direction the vehicle will be facing when it spawns in.

Select your vehicle spawn (click **Select** and then click on the vehicle spawn) and you&#39;ll see the **Object Instance** box appear to the right. It looks something (exactly like, actually) this:

T ![](RackMultipart20220212-4-1ry6aw9_html_5892569761cf91b6.jpg) he first parameter, **ControlZone** refers to what CP this vehicle is associated to. The value that should be entered here is the name of the CP, **NOT THE NAME OF THE CONTROL REGION,** that you want this vehicle to be associated to. For example, cp1, or cp5. **NOT** cp1\_control, or cp5\_control.

The second parameter specifies how many of these vehicles you want to spawn from this vehicle spawn. I recommend always keeping this set to 1, and just add more vehicle spawns if you want more vehicles at a given CP.

ExpireTimeEnemy specifies how long a vehicle will sit idle, un-manned once the enemy has taken over the associated CP, before the vehicle will begin to decay.

ExpireTimeField specifies how long a vehicle will sit idle, un-manned in the field once it has left it&#39;s control region.

DecayTime specifies how long a vehicle will take to decay and self-destruct once the expire time has been reached.

The vehicle that will spawn from this vehicle spawn is determined by what you enter in the **Class** fields. For example, if you wanted this vehicle spawn to spawn a rebel combat speeder when the rebels own this CP, you would enter **all\_hover\_combatspeeder** into the **ClassAllATK** field. This is assuming that the rebels are set as team 1. Whether a team is ATK or DEF is determined by what team they are set as. ATK will spawn vehicles when that team is set as **team 1** , DEF will spawn vehicles if that team is set as **team 2.**

Note: 2 values that are no longer used are **ClassHisATK and ClassHisDEF**. Entering values in this field will accomplish nothing, so….just don&#39;t bother.

If you click **Page DN** you&#39;ll see that there are more Class fields. As another example, if you want this vehicle spawn to spawn an ATST on a map where the rebels are team 1, and the empire is team 2, then you would click **Page DN** and enter **imp\_walk\_atst** into the **ClassImpDEF** field.

You can also have vehicle spawns spawn vehicles when either team owns the CP. If this is the case, you could enter both **all\_hover\_combatspeeder** under **ClassAllATK** AND **imp\_walk\_atst** under **ClassImpDEF**.

Additionally, you can use a vehicle spawn to spawn vehicles for both eras, you just need to specify the vehicle classes in the corresponding Classparameters.

### Distributing your new level/mod

O ![](RackMultipart20220212-4-1ry6aw9_html_57ffa2d222a05ddc.jpg) nce you have spent endless hours perfecting your new creation, to distribute your new level to other Battlefront II players, all you have to do is go to your mod folder in your Battlefront II folder; **\Star Wars Battlefront II\GameData\Addon\ABC,** zip all the data in there up, and SHIP IT! _Note: you want your zip file to contain ONLY the path info from_ _ **Addon** _ _forward, so in winzip, your file should look like this(pay particular attention to the Path section):_

### BF2\_modtools.exe

Along with the Mod tools, we&#39;ve released an executable that you can use to run Star Wars Battlefront 2 in a mode that will allow you access to the dev console (press ~ when in the game) which will help make debugging, and developing your mod easier. This executable still has a CD check, and has been crippled in some ways so as not to be used as a stand-alone exe to run and play the game. BF2\_modtools.exe can be found in the root of the **BF2\_** ModTools folder. This .exe is completely unsupported, as is everything else in this mod tools release. See the mod tools EULA for more info.