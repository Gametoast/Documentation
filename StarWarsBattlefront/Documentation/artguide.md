SWBF Mod Tools

**ART DESIGN GUIDE**

General walk-thru for creating objects for SW Battlefront

Models created in XSI can be put directly into the SW Battlefront engine with the proprietary exporter and by following a few simple rules.

Polygon Count Limits (general guidelines):

Props - 0 - 500 polys  
Buildings - 200 - 3000 polys (the higher end of this spectrum represents large buildings with large interiors)  
Vehicles - 1500 - 2000 polys  
Characters - 1500 - 2000 polys  

Every object will need a low resolution version of the mesh for LOD purposes. Those should be approximately 1/3rd of the original model's poly count, and a child of the model's root node. You must declare it a LOD mesh by appending "\_lowrez" to its object name.

Every model also requires collision objects and shadowvolumes to be inserted into the hierarchy. See appendices b and c.

Textures are required to be scaled in powers of 2, with 512 x 512 being the standard used in the PC version. They all should be 24 bit .tga's, unless there is an alpha channel, then it will be a 32 bit file.

Steps to creating a basic prop:  
1\. Construct a fairly low-poly mesh (again, 0-500 polys for a prop) in XSI with the center of the root node with a translation of (0,0,0) in the scene. Try to minimize the number of actual objects in the prop by merging them. If it is not possible, just make sure all objects belong in one hierarchy, because if you don't, not all of them will be exported. Clusters are ok, but there can be only one set of textures coordinates. If you want to use a texture with an alpha channel, see Appendix A.  
2\. Create a shadowvolume. See Appendix B.  
3\. Create collision objects. See Appendix C.  
4\. Export the mesh. See Appendix D.  

CREATING TERRAIN CUTTING OBJECTS

Each object that cuts terrain must:  
Contain an object that is named "terraincutter"  
Must be a child of an object.. not hidden on export.  
Then after it is placed in the world through Zeroeditor it must be saved so the terrain file is overwritten.  
After updating the world and TER file, there should be a hole in game.  
At this point the cutter can be hidden on the object,(or for that matter removed?)  
If its position or size changes it must be rexported and the terrain updated/saved again.  
terraincutter object can not be concave. Multiples must be used to accomplish that.

if you have multiple terrain cutters they must be named  
terraincutter1  
terraincutter2  
terraincutter3  
" " no underscore between # terraincutter\_2  

Appendix A  
Guide to using Transparency Maps

Follow these steps to create objects that use transparency maps.

1\. Create a texture with an alpha channel and save it as a 32 bit TGA.  
2\. Apply it to the model.  
3\. Select all polygons that will be affected by the transparency map and run the EDIT FLAGS script.  
4\. A dialogue box will appear. Select either single or double sided transparency depending on your need or preference. Say OK.  
5\. If done correctly, you should notice an orange property box in the explorer under the newly flagged object. You can also edit the applied property box by clicking on the orange square itself anytime after the initial application. But, if you want to add additional polygons into the transparency flag, it is best just to delete the property, select all the polygons you want, and re-run the script.

Appendix B  
Shadowvolumes

Shadowvolumes are special meshes that are created to mimic the model in shape and profile to cast shadows onto terrain and other objects. It can also be used for self-shadowing. Follow these steps to create a shadowvolume:

1\. Create a low-poly mesh that is slightly smaller in scale than the original model's mesh. When both the original mesh and the shadowvolume are unhidden, you should not see any of the shadowvolume sticking out of the original model. Try to keep it as low-poly as possible, but pay special attention to the profile from the top down view or whatever angle the sun will be at in relation to the model. The silhouette is what needs the most attention, because this is what gets cast onto other objects. Also, the mesh must be completely closed without any open ends or polygons, and its global center is 0,0,0.  
2\. Once created, name the shadowvolume mesh "shadowvolume". If there is more than one, name them "shadowvolume", "shadowvolume1", "shadowvolume2", etc.  
3\. Make the shadowvolume mesh a child of the actual mesh to which it is related. This is especially important when there are multiple shadowvolumes and bones and animated parts in the model. If the original mesh is skinned, then the shadowvolumes should be children of their respected bones. Otherwise, they should just be children of the individual objects.  
4\. Select the shadowvolume mesh.  
5\. In the Animate menu, select Create -> Parameter -> New Custom Parameter.  
6\. In the dialogue box, rename the Parameter Name to shadowvolume. Uncheck the Animatable Characteristic Button.  
7\. Hide the shadowvolume mesh before export

Appendix C  
Collision Meshes

Collision meshes are simple low-poly meshes that are used by the game engine to calculate when and how objects collide with each other. There are 2 types of collision meshes used in SW BattleFront: collision meshes and collision primitives.

Collision Mesh  
1\. This is usually a low-poly yet fairly conforming version of the original mesh. It is most often used for soldier and ordnance collision since those are most obvious ways to see collision mesh correctness. For example, you can see the ordnance collision on an object by shooting at it with any weapon. If the collision is sloppy and covers gaps or is not correctly aligned with the original mesh, then you will see the laser blasts hit empty space or inside the actual geometry of the model. The collision mesh has to be named "collision", or if there are more than one, "collision", "collision1", "collision2", etc. Multiple collision meshes will all get merged into one when munged. This is very important when considering rule #3. Do make the collision mesh a child of the root node or its corresponding node, and make sure its global center is at 0,0,0.

2\. Enabling the Collision Mesh: if the vehicle .MSH file has a corresponding .OPTION file, then it might contain the argument "-nocollision". This is to prevent generation of a default collision mesh using the model's full geometry. If you have specified a collision mesh in XSI, you will need to remove this argument from the .OPTION file.

3\. Collision meshes can NOT be used on moving parts (turrets, bones etc). When the vehicle is munged, all collision mesh nodes are merged into a single non-articulated collision mesh. If a moving part on a vehicle requires collision, it will have to be specified with a primitive.

4\. If a vehicle has a collision mesh, it will automatically be used when colliding with soldiers and ordnance. Collision meshes (on vehicles) are not used for any other type of collision. Primitives must be used when vehicles collide with terrain, buildings, and other vehicles. Collision Primitives  
\--- Collision Primitives are a cheaper and faster way of computing collision for the game engine. It is also the only way to have collision on moving parts such as turrets or bones. Collision primitives can be either cubes, cylinders, or spheres. Cubes can be scaled in x,y, and/or z to better fit the geometry they are conforming to. It is best to leave the original size of 8 units as is and scale the cube from there. On the other hand, cylinders and spheres CANNOT be scaled. Instead, use the polygon properties such as radius and length to control the size of those 2 primitives. Also very important, primitive collision pieces CANNOT be frozen or lose their primitive properties. This information is taken directly into the game engine and if it is lost, the engine will most likely ignore the primitive collision. Lastly, DO NOT move the center of primitive collision either or else the proper information will be lost as well.

\---There is a limit of 32 collision primitives per model (or 31 primitives + 1 collision mesh).

\---Colliding with buildings (including bridges, stairways, etc) is a little tricky with primitives. It is best to use spheres and cylinders on the vehicle for building collision. Boxes just get converted to spheres in the code so long skinny boxes end up colliding as if they were large spheres. \*\*\*Note: if you must use boxes for the vehicle, you can instead create primitives for the building msh. In the building's odf file, you can then specify to use these primitives for VehicleCollision\*\*\*

\*\*\*\*\*\*\*\* Specifying Collision in ODF file \*\*\*\*\*\*\*\*  
\---For any game object (true for vehicles and buildings), you can specify which collision primitives will be used when colliding with another object. For example, the AAT ODF file has the following:
```
TerrainCollision = "p_base"

VehicleCollision = "p_base"  
VehicleCollision = "p_tank"  
VehicleCollision = "p_barrell"  
VehicleCollision = "p_turrett"

SoldierCollision = "p_base"  
SoldierCollision = "p_tank"  
SoldierCollision = "p_barrell"  
SoldierCollision = "p_turrett"

BuildingCollision = "p_ball1"  
BuildingCollision = "p_ball2"  
BuildingCollision = "p_ball3"  
BuildingCollision = "p_ball4"  
BuildingCollision = "p_ball5"  
BuildingCollision = "p_ball6"  
BuildingCollision = "p_guns"  
BuildingCollision = "p_turrett"  
BuildingCollision = "p_barrell"  
```

If you wanted to, you could also use OrdnanceCollision = "p\_whatever" to specify what primitives to use when ordnance collide with the object.

\---Finally, if  
1\. a vehicle has a collision mesh, AND  
2\. SoldierCollision and/or OrdnanceCollision is specified in its ODF file,

then the primitives specified in the ODF file will be used (for SoldierCollision and OrdnanceCollision) as well as the collision mesh. In this way, you can create a collision mesh for the non-moving parts of the vehicle, and add collision primitives for the moving parts, and use them both when colliding with soldiers or ordnance.

Appendix D  
Mesh Exporting

The Mesh Exporter is a program/script that takes geometry models created in XSI and converts them into a .msh file that the SW Battlefront engine can understand and use in the game. Here are the steps needed to export a model:

1\. Make sure the root node is centered in the XSI world at 0,0,0. If this is not so, you may get an unexpected center or position of the exported model in the game.  
2\. Branch select the object(s) you want to export.  
3\. Run the XSI2Mesh Exporter script.  
4\. This opens a dialogue box. In this you:  
        a. In the Path box, browse or put in the correct path that you would like the .msh to be exported into. Also type in the filename in the filename box.  
        b. Check the first box "Export Selected Models Only"  
        c. Check the "Export Animations" box. ONLY if the model is animated and has a .zaabin or .zaafin file  
        d. Check the "Export Textures" box if the texture is not in the target location of the .msh file.  
5\. Another pop-up box will show the progress of the export, once this closes, your export is complete.