7

# **Layers for Game Modes**

**A Play in Four Acts**

By Mike Zaimont

**Characters:**

**Mike Z** – Benevolent giver of life and bearer of truth.

**You, the Reader** – Person possessing an unquenchable thirst for knowledge.

**Niles Westinghouse Livingston III** – the coolheaded Englishman.

**Table of Contents:**

Act I – The Scent of Change: **What does all this mean?** A confused Reader begins his quest.

Act II – A New World Order: **Changes to adding/deleting/renaming layers.** The Reader absorbs knowledge and gains proficiency.

Act III – The Significance of Insignificance: **New rules that must be obeyed when using the editor, in order for everything to work correctly.** The Reader learns how to avoid getting in trouble with the law.

Act IV – Mean Median à la Game Mode: **The ins and outs of working with Game Modes.** The Reader puts all of his newly acquired know-how to work improving the human condition.

**Act I – The Scent of Change**

Upon poking its head &quot;up out tha&#39; bedizzle&quot;, the Reader is surprised to discover that, all of a sudden, Layers for Game Modes has been implemented &quot;all up in there.&quot;

What does this mean? A few things…

- **Game Modes exist!** A Game Mode is a collection of layers that are referred to by name (&quot;Conquest&quot;, &quot;CTF&quot;) and which may be skipped or loaded on a per-LUA basis. Layers in the Common Game Mode are always loaded if the world is loaded, but other Game Modes must be loaded explicitly in a mission LUA. Therefore, all objects/regions/paths/lights in the layers for a given Game Mode are not present in-game unless that mode is loaded.

- Layers in the editor are now of infinitely more significance than before. Rules have changed, national boundaries have shifted, and the fundamental harmonics of existence have been rearranged in subtle but alluring ways.

- A new button is present nearish the top of the editor: ![](RackMultipart20220212-4-1y2dxs2_html_737aeb99997333b4.png)

- The world REQs (\*.req) for every world is now moved into that world&#39;s folder (ex. tat\tat1.req became tat\world1\tat1.req).

- Previously working things, such as vehicle spawns, may have inexplicably broken.

**Act II – A New World Order**

Layers are now separate entities, rather than mere constructs of convenience within the editor. Each layer, and the objects, paths, regions, and lights contained therein, may be chosen to be part of one or more game modes, and therefore selectively loaded by LUA.

**TO ADD, DELETE OR RENAME A LAYER** there are now extra steps:

- Check out at least the World file (\*.WLD), the Layer Index file (\*.LDX), the World REQ (\*.REQ), and any Mode REQs (\*.MRQ) for your world.

- Open the editor. Add, delete, rename or otherwise modify the layers you wish to.

- Click ![](RackMultipart20220212-4-1y2dxs2_html_737aeb99997333b4.png)

- Set up any Game Modes you wish to (discussed later).

- In the Game Modes window, click ![](RackMultipart20220212-4-1y2dxs2_html_9a8eceef57a56daf.png) , select the World REQ, and click Open. If there are no errors reported, it succeeded. **Do this for each World REQ if your World has multiple REQs.** This step rewrites all .REQ and .MRQ files, which need to be checked in again, and may create new ones which need to be added to Perforce.

- Save the World. (Don&#39;t forget not to kill the villain – let him escape so you may foil his plot again another day.)

- Don&#39;t forget to check back in the world REQ, the layer index (LDX), and any and all Mode MRQs which were created.

- Munge it. If you have not used Game Modes yet, it may be advisable to clean first.

- Rejoice!

**Act III – The Significance of Insignificance**

Herein lies a list of the **NEW RULES** that must be obeyed now that layers are self-contained:

- Any vehicle spawns MUST be in the SAME LAYER as the command post they are associated with, if they are associated with one.

- The capture and control regions for a command post MUST be in the SAME LAYER as the command post.

…more to come, O Gentle Reader.

**Act IV – Mean Median à la Game Mode**

So, how does one go about creating and using an original Game Mode? Have at it!

---This assumes you have already created the layers you wish to use (for example, a Capture the Flag layer or two, with objects like flag spawns inside them). If not, go do that now.---

- As with layer creation and deletion, check out at least the World file (\*.WLD), the Layer Index file (\*.LDX), the World REQ (\*.REQ), and any Mode REQs (\*.MRQ) for your world.

- Click ![](RackMultipart20220212-4-1y2dxs2_html_737aeb99997333b4.png) . You now see:

![](RackMultipart20220212-4-1y2dxs2_html_229c5c64410da0a1.png)

-- the Common layers - the list of Game Modes – the layers in the current Game Mode --

**Rules:**&quot;Common&quot; layers are always loaded in-game. Layers present as part of a Game Mode are only loaded if that mode is loaded. **Layers may NOT be part of both Common and a Game Mode.** This is enforced.

**To Create a Game Mode:** Under Mode Name, click Add. Click on the game mode just created, and give in a new (and if you&#39;re lucky, creative) name. Don&#39;t forget to press Enter after entering the name.

**To Remove a Game Mode:** Under Mode Name, click in the listbox on the game mode you wish to remove, then click Remove.

**To Add a Layer to a Game Mode: F** irst, click on that layer under Common Layers, and REMOVE it from the Common section. Next, select the game mode you wish to add the layer to from the listbox. Finally, under Layers Used, click Add, select the layer from the list, and click OK.

**To Remove a Layer From a Game Mode:** Select the Game Mode from the listbox. Select the layer from the layer list and click Remove.

**\*\*\*Once all your Modes are set up:** As with layer editing, click ![](RackMultipart20220212-4-1y2dxs2_html_9a8eceef57a56daf.png) , select the World REQ, and click Open. If there are no errors reported, it succeeded. **Do this for each World REQ if your World has multiple REQs.** This step rewrites all .REQ and .MRQ files, which need to be checked in again, and may create new ones which need to be added to Perforce. **Don&#39;t forget to save your World! And to munge. :^)**

**To use a Game Mode in-game:** Choose a mission LUA and open it. In our example, we are going to add the Conquest Game Mode to Hoth, in hot1g\_c.lua.

When each Game Mode is saved, the name of the MRQ is

WorldName\_GameMode.mrq. **Note that the world name may not be the same as the game&#39;s .lvl file name – in the case of Hoth, there is hot1.lvl, but the world name is &quot;hoth.wld&quot;.**

In the LUA, find the spot where the level is loaded – it will have the world on a line by itself:

ReadDataFile(&quot;HOT\\hot1.lvl&quot;)

(**This is NOT in the sound section.)**

Right now, that means the game is just loading the Common layers.

Add the full names of any additional Game Mode MRQs you wish to load from this LUA, and leave off the &quot;.mrq&quot;. For example, if we have made a Conquest game mode (which created &quot;hoth\_Conquest.mrq&quot;), then we would change it to:

ReadDataFile(&quot;HOT\\hot1.lvl&quot;, &quot;hoth\_Conquest&quot;)

That&#39;s it! Save the LUA, re-munge Common and enjoy the new objects that appear or don&#39;t. :^)

# _ **Fin** _