SWBF Mod Tools **Game Overview**  
At it's core each level consists of a minimum of two opposing teams each owning at least one command post from which their units spawn. Each command post can be captured by the enemy if a unit enters a capture region linked to the command post and holds it's position for long enough. When a command post is captured the spawn path attached to it is taken over by the capturing team and it's units will spawn from that command post. When all of the command posts are owned by one team or a team runs out of reinforcements the game is over.

The game itself is made up of levels created with a terrain editor consisting of objects created with Softimage XSI and exported using a special add on that outputs a mesh file. The models are recognized by the editor by way of an Object Definition File, a text file that defines an object and all of it's properties. The ODF files define the properties of objects not just for the game but also for the editor. Once a model is exported an ODF file must be manually created first before it can be used in the editor.

The terrain editor is a heightmap editor and object layout application that allows for generation and manipulation of a textured vertex heightmap as terrain as well as opening models exported from XSI. In addition to manipulation of objects and terrain the editor also has modes for creating unit spawn paths and vehicle spawns, AI paths and barriers, invisible capture, control, sound, and shadow regions, and map boundaries. Files saved by the editor are used by the munge compiler in a two step process to prepare assets for use in the game as an add on.

Level Requirements  
Each level requires some type of terrain or object on which to play, two command posts and two teams. Teams capture enemy command posts or eliminate enemy reinforcements in order to win a victory on a level. As long as a team holds more than zero command posts and has reinforcements the victory/defeat clock will not start.

Terrain  
Each level must have a terrain or object on which the players can spawn. If a vertex map terrain is not created then models imported into the world can serve as the battle platform. Units can only be spawned from fixed positions, meaning units cannot spawn inside vehicles so some type of fixed object is required.

Teams  
Each team on a level consists of up to 5 Unit Classes and 1 Hero Class. The Hero Class units on a level are always non-playable characters. Each Unit Class is defined as a specific unit type whose in game count can be set manually while only one hero per team can be in play at a time. Units are spawned into the world from Spawn Paths that are attached to team-owned command posts.

Command Posts  
Command posts are buildings or objects that can be owned or captured by a team. Each command post is assigned a value to each team in a given mission. Enemy units attack command posts based on their value and proximity. AI will target the nearest command post first, and if more than one is an equal distance away the one of highest value will be targeted first. Each command post also has a Bleed Value, which is taken into account to determine the rate at which a team�s reinforcement count degrades throughout the mission. Command posts are typically attached to a Spawn Path, a Capture Region, and a Control Region.

Spawn Paths  
Spawn Paths are invisible objects from which units spawn into the game. Spawn Paths must be attached to command posts to function. Each spawn path has a unique name that is attached to the command post and an unlimited number of spawn nodes that acts as points from which units spawn. While a command post may exist in one place, the spawn points associated with it can be scattered across a map.

Capture Regions A Capture Region is attached to a command post instance and acts as a zone that when occupied by an enemy unit triggers the capture of a command post. It is the center of the capture region that the AI units flock to in order to capture a command post.

Control Regions  
Control Regions can also be attached to command posts. A control region is used to control whatever is within it when the command post it belongs to is owned by a particular team. The most common use for control regions is to act as zones where vehicles can be spawned and remain intact without degrading. Once a vehicle leaves a team�s control zone it is considered "in the field" and if abandoned will begin degrading. A Vehicle Spawn point must also be located within a control region in order to spawn vehicles.

Barriers  
Objects on a level are not recognized by the AI when it plans it�s course to a command post. Barriers are placed around objects the AI can collide with so they will plot a course around the object. Barriers act as invisible boxes that the AI recognize and calculate the area of in order to plot a course around objects. Each barrier also has a set of filters that determine what AI types can pass through them. AI cannot chart a course to a command post that is within a barrier filtering out that AI type.

Planning Paths  
Planning Paths are made up of Hubs and Connections forming a Connectivity Graph that defines routes taken by AI as they plot a course to a command post. When an AI unit plans a path to a command post it looks for the closest command post that is not owned by it�s team and charts a course. By default, the AI will take the most direct course from it�s starting point, a straight line. When a connectivity graph is present the AI looks first for the nearest command post, then the nearest connectivity hub and sets whichever is closer as it�s destination.

Hint Nodes  
To further control AI behavior, Hint Nodes can be used. Hint Nodes are hotspots with properties that designate AI behavior on those spots. These include Snipe, Patrol, Jet Jump, Mine, Cover, Access, and Land. These node types also have additional properties such as attack/defend, standing, prone or crouch. When an AI comes into proximity with a Hint Node they will occupy it and take the specified action if applicable. If after a certain amount of time the unit encounters no enemy units it will leave that node and plot a course to the nearest command post not owned by it�s team. Gun turrets do not require hint nodes for AI to occupy them, technically the turrets are vehicles but are treated like Hint Nodes by the AI.

Boundaries  
Each map has at least one Boundary that when crossed triggers a countdown to death and a message that the unit is leaving the battlefield. Boundaries are required not just to define the playable area on a map but also to control the aesthetic appearance of the battlefield. If a unit moves too close to the edge of the map, the edge of the terrain or sky can become visible.

Vehicle Spawns  
A Vehicle Spawn is in an invisible object that when placed in the control region of a command post can spawn a vehicle for the team that owns the command post. Vehicle spawns can spawn different vehicles for each team or no vehicles at all.

Common Objects  
There are numerous common objects in the game that provide functionality to maps. These include Weapon Recharge Droids, Health Recharge Droids, Vehicle Recharge Droids, and Gun Turrets. These objects are not team or world specific.

Add On Functionality  
When the game is executed after the 1.11 (Jabba's Palace) patch has been installed, the game looks for the Add On folder and any folders beneath it. TAT3 is there by default. It looks at each folder in the Add On folder in order for an addme.script file and appends the in game mission list with new map names one by one.

Compiled add on maps also make use of assets shipped with the game, so even though they are not beneath the add on folder, the maps require the intact assets of the shipped version of the game.

Files required to run an Add Ons are created first building a new map and compiling a new map. This can be done with BFBuilder.hta in an automated fashion or by using the manual instructions provided in the tutorial. While this is not difficult, there are manual steps that must be taken and a solid understanding of how the game is built will be required. Mod Templates have been provided as examples for reference as well as starting points. Each Mod Template can be loaded and saved to a new folder under a new name and then edited manually so it will run.