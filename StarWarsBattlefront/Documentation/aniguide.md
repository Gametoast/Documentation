SWBF Mod Tools

**MESH & ANIMATION EXPORTING**

Mesh  
Place meshes zeroed in world, XZ plane is floor.  
Freeze all transforms, (Zeroing out transform pivot point).  
Assign a material, (either Lambert or Phong), to each mesh.  
Assign a texture, (only one for enveloped objects), to each mesh.  
Freeze the geometry, (collapse stack, delete construction history, whatever you like to call it).

Bones  
Place bones with hierarchy as children of mesh. Bones can be Skeleton 2D/3D chain bones or nulls. (Bones can be geometry as well but shouldn't be used in the mesh.)  
Place a traversing bone, (usually a null), as parent of the mesh. (just called "dummyroot") This bone defines the mesh traversing along the ground.  
All bones mush have a direct parent/child relation. (Chain bone effectors must be linked to the last bone in IK chain.)  
Place a world bone, (usually a null), as a parent to the traverse bone, (just called "grounddummy"), This will allow you to offset the animation starting point in the world.  
Place hardpoints, (usually nulls or simple geometry), wherever needed. Hardpoints are simply bones that have the prefix "hp\_". They are used as transform nodes that can be used as reference points for placing weapons, event hot spots, etc.

Rig  
Rig nodes should not be in the hierarchy of the skeleton. Rig elements could be regarded as bones or offset child bone transforms otherwise. Use rig controllers to drive IK effectors and up vectors. Bones can be animated with IK or FK depending on the situation.

Enveloping  
Most meshes require rigid enveloping meaning only one bone influence for each vertex, (this is mostly for soldiers & vehicles). Otherwise, you could have up to 3 bones influence each vertex but you must define it as "-softskin" in the meshes .option file, (I hope .option files are covered elsewhere). ;)

Animation  
Do not animate the mesh, skeleton 2D/3D chain bone roots or effectors. It will offset child bones transforms. The traverse bone must start at the world bone, (it will zero the traverse bone transforms.) This is good for if you have multiple animations in a scene with different starting locations. The traverse bone must have only two keyframes from the beginning of the animation to the end of the animation sequence with only linear interpolation, (you could use spine interpolation to normalize certain overextended motions).

Exporting The Mesh  
The enveloped mesh with the skeleton mush be exported as the in-game object name and the skeleton itself must be exported individually as a basepose, (called "basepose.msh").

Exporting The Animations  
Remove all meshes from the skeleton hierarchy.  
Set the start and end frame in the playback timeline boxes.  
Branch select the traverse bone.  
Export the mesh the using the exporter plugin. Be sure to have "Export Selected Models Only", "Export Animations" & "Export FK Animation" selected.