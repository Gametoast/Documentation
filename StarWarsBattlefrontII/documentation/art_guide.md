**ART DESIGN GUIDE**

General walk-thru for creating objects for SW Battlefront

Models created in XSI can be put directly into the SW Battlefront engine with the proprietary exporter and by following a few simple rules.

Polygon Count Limits (general guidelines):

Props - 0 - 500 polys
 Buildings - 200 - 3000 polys (the higher end of this spectrum represents large buildings with large interiors)
 Vehicles - 1500 - 2000 polys
 Characters - 1500 - 2000 polys

Every object can be exported by itself, but if you want to see it from a distance you will need a low resolution version of the mesh for LOD purposes. Those should be approximately 1/3rd of the original model&#39;s poly count, and a child of the model&#39;s root node. You must declare it a LOD mesh by appending &quot;\_lowrez&quot; to its object name.

Every model also requires collision objects and shadowvolumes to be inserted into the hierarchy. See appendices b and c.

Textures are required to be scaled in powers of 2, with 512 x 512 being the standard used in the PC version. They all should be 24 bit .tga&#39;s, unless there is an alpha channel, then it will be a 32 bit file.

Steps to creating a basic prop:
 1. Construct a fairly low-poly mesh (again, 0-500 polys for a prop) in XSI with the center of the root node with a translation of (0,0,0) in the scene. Try to minimize the number of actual objects in the prop by merging them. If it is not possible, just make sure all objects belong in one hierarchy, because if you don&#39;t, not all of them will be exported. Clusters are ok, but there can be only one set of textures coordinates. If you want to use a texture with an alpha channel, see Appendix A.
 2. Create a shadowvolume if needed. See Appendix B.
 3. Create collision objects. See Appendix C.
 4. Export the mesh. See Appendix D.

Appendix A
 Guide to using Transparency Maps

Follow these steps to create objects that use transparency maps.

1. Create a texture with an alpha channel and save it as a 32 bit TGA.
 2. Apply it to the model.
 3. Select all polygons that will be affected by the transparency map and run the EDIT FLAGS script.
 4. A dialogue box will appear. Select either single or double sided transparency depending on your need or preference. Say OK.
 5. If done correctly, you should notice an orange property box in the explorer under the newly flagged object. You can also edit the applied property box by clicking on the orange square itself anytime after the initial application. But, if you want to add additional polygons into the transparency flag, it is best just to delete the property, select all the polygons you want, and re-run the script.

Appendix B
 Shadowvolumes

Shadowvolumes are special meshes that are created to mimic the model in shape and profile to cast shadows onto terrain and other objects. It can also be used for self-shadowing. Follow these steps to create a shadowvolume:

1. Create a low-poly mesh that is slightly smaller in scale than the original model&#39;s mesh. When both the original mesh and the shadowvolume are unhidden, you should not see any of the shadowvolume sticking out of the original model. Try to keep it as low-poly as possible, but pay special attention to the profile from the top down view or whatever angle the sun will be at in relation to the model. The silhouette is what needs the most attention, because this is what gets cast onto other objects. Also, the mesh must be completely closed without any open ends or polygons, and its global center is 0,0,0.
 2. Once created, name the shadowvolume mesh &quot;shadowvolume&quot;. If there is more than one, name them &quot;shadowvolume&quot;, &quot;shadowvolume1&quot;, &quot;shadowvolume2&quot;, etc.
 3. Make the shadowvolume mesh a child of the actual mesh to which it is related. This is especially important when there are multiple shadowvolumes and bones and animated parts in the model. If the original mesh is skinned, then the shadowvolumes should be children of their respected bones. Otherwise, they should just be children of the individual objects.
 4. Select the shadowvolume mesh.
 5. In the Animate menu, select Create -\&gt; Parameter -\&gt; New Custom Parameter.
 6. In the dialogue box, rename the Parameter Name to shadowvolume. Uncheck the Animatable Characteristic Button.
 7. Hide the shadowvolume mesh before export

Appendix C
 Collision Meshes

Collision meshes are simple low-poly meshes that are used by the game engine to calculate when and how objects collide with each other. There are 2 types of collision meshes used in SW BattleFront: collision meshes and collision primitives.

Collision Mesh
 1. This is usually a low-poly yet fairly conforming version of the original mesh. It is most often used for soldier and ordnance collision since those are most obvious ways to see collision mesh correctness. For example, you can see the ordnance collision on an object by shooting at it with any weapon. If the collision is sloppy and covers gaps or is not correctly aligned with the original mesh, then you will see the laser blasts hit empty space or inside the actual geometry of the model. The collision mesh has to be named &quot;collision&quot;, or if there are more than one, &quot;collision&quot;, &quot;collision1&quot;, &quot;collision2&quot;, etc. Multiple collision meshes will all get merged into one when munged. This is very important when considering rule #3. Do make the collision mesh a child of the root node or its corresponding node, and make sure its global center is at 0,0,0.

2. Enabling the Collision Mesh: if the vehicle .MSH file has a corresponding .OPTION file, then it might contain the argument &quot;-nocollision&quot;. This is to prevent generation of a default collision mesh using the model&#39;s full geometry. If you have specified a collision mesh in XSI, you will need to remove this argument from the .OPTION file.

3. Collision meshes can NOT be used on moving parts (turrets, bones etc). When the vehicle is munged, all collision mesh nodes are merged into a single non-articulated collision mesh. If a moving part on a vehicle requires collision, it will have to be specified with a primitive.

4. If a vehicle has a collision mesh, it will automatically be used when colliding with soldiers and ordnance. Collision meshes (on vehicles) are not used for any other type of collision. Primitives must be used when vehicles collide with terrain, buildings, and other vehicles. Collision Primitives
 --- Collision Primitives are a cheaper and faster way of computing collision for the game engine. It is also the only way to have collision on moving parts such as turrets or bones. Collision primitives can be either cubes, cylinders, or spheres. Cubes can be scaled in x,y, and/or z to better fit the geometry they are conforming to. It is best to leave the original size of 8 units as is and scale the cube from there. On the other hand, cylinders and spheres CANNOT be scaled. Instead, use the polygon properties such as radius and length to control the size of those 2 primitives. Also very important, primitive collision pieces CANNOT be frozen or lose their primitive properties. This information is taken directly into the game engine and if it is lost, the engine will most likely ignore the primitive collision. Lastly, DO NOT move the center of primitive collision either or else the proper information will be lost as well.

---There is a limit of 64 collision primitives per model (or 63 primitives + 1 collision mesh).

**NEW BFII UPDATE FOR COLLISION AND USING PRIMITIVES**

The game now supports the use of new naming conventions in XSI – no more ODF magic required!

The old naming conventions are still valid – naming primitives &quot;p\_name&quot; and mesh &quot;collision\_name&quot; - but if you use these you still need to do soldier/vehicle/etc separation the old way through ODFs.  Nothing old will break, but there&#39;s no reason to do anything new using ODF definitions.

**New names:**

**Primitives –     p\_-xxx-name    ----    (&quot;p&quot; underscore hyphen [types] hyphen name)**

**Mesh –     collision\_-xxx-name    ---    (&quot;collision&quot; underscore hyphen [types] hyphen name)**

**xxx is replaced with the type definitions below…**

**[Types] is any combination of the following:**

**s – Soldier (soft) collision**

**v – Vehicle (rigid) collision**

**b – Building (static) collision**

**o – Ordnance (ordnance :^) collision**

**t – Terrain collision**

So if you made a cube and wanted it to be used for soldier and vehicle collision, you&#39;d name it

&quot;p\_-sv-SomeName&quot;

Or if you wanted it to be used for ordnance collision only, you&#39;d name it

&quot;p\_-o-SomeName&quot;

Typicly ordnance collision needs to be more accurate so you could make a mesh and, you&#39;d name it

&quot;collision\_-o-SomeName&quot;



\*\* A word about meshes:  Multiple collision meshes for one object that you have are (and always were) MERGED at munge-time into ONE collision mesh.  So you can&#39;t have 2 collision meshes, one for ordnance and a different part for soldier.  They will be merged together and used for one or the other.

So how does the new naming stuff work with this?  If you have multiple collision meshes, and you name ANY of your collision meshes with the new scheme, that name will be applied to ALL the parts.

Example:

You have 3 mesh parts, &quot;collision\_1&quot;, &quot;collision\_2&quot;, and &quot;collision\_-s-3&quot;.  They will be merged together, and the resulting goop will be used for soldier collision.

  Or

You have 3 mesh parts, &quot;collision\_1&quot;, &quot;collision\_2&quot;, and &quot;collision\_3&quot;.  They will be merged together, and the resulting goop will be used for all types, **Soldier, Vehicle, Building, Ordnance,** and **Terrain** collisions which can be costly to framerate.

Granted any object can still be exported with one mesh collision called &quot;collision\_SomeName&quot;

And it will work just fine, but Typically you will be Using p-collision for the easy parts, and collision mesh for the complicated situations, If you want those frames-per-second back, it&#39;s gotta happen.

The maximum allowed number of collisions per object is now 64 That is, 64 TOTAL objects, so:

64 primitives

-or-

63 primitives and one collision mesh.  (Remember that all collision meshes are merged into one mesh at munge time, so basically 63 primitives and some meshes.)

Appendix D
 Mesh Exporting

The Mesh Exporter is a program/script that takes geometry models created in XSI and converts them into a .msh file that the SW Battlefront engine can understand and use in the game. Here are the steps needed to export a model:

1. Make sure the root node is centered in the XSI world at 0,0,0. If this is not so, you may get an unexpected center or position of the exported model in the game.
 2. Branch select the object(s) you want to export.
 3. Run the XSI2Mesh Exporter script.
 4. This opens a dialogue box. In this you:
         a. In the Path box, browse or put in the correct path that you would like the .msh to be exported into. Also type in the filename in the filename box.
         b. Check the first box &quot;Export Selected Models Only&quot;
         c. Check the &quot;Export Animations&quot; box. ONLY if the model is animated and has a .zaabin or .zaafin file
         d. Check the &quot;Export Textures&quot; box if the texture is not in the target location of the .msh file.
 5. Another pop-up box will show the progress of the export, once this closes, your export is complete.