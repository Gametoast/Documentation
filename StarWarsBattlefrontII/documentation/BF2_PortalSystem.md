3/28/2005

Jake Cannell

# **BattleFront 2 Sector/Portal Visibility System** :

### Overview:

This is a relatively simple visibility system that can cut down rendering time significantly on levels with heavy occlusion (indoor levels mainly). The system relies on breaking up the world into regions of visibility called Sectors and then linking them together through Portals. Sector A is visible from Sector B if and only if there is a path through visible portals leading from A to B. The real-time rendering book has a more in-depth explanation along with pretty pictures which can provide greater clarity.

Designing a level with Sectors and Portals:

To take most advantage of portal culling, the level should have natural &#39;chokepoints&#39; which limit visibility, such as doors, narrow corridors, and so forth. A level with a high level of occlusion and well defined Sectors and Portals can have a significantly higher total object count and more overall detail than comparable outdoor levels for the same performance level. Its important that the level is broken up into small logical units that correspond to Sectors. Ideally, each individual room should be its own seperate object, and long complex corridors should be broken up into smaller straight segments. This allows for smaller sectors and more portals and a higher culling ratio and thus a higher framerate.

### Placing Sectors and Portals in ZeroEdit:

Sectors are a special object defined as a group of edges that form a boundary around the Sector along with a floor height and a ceiling height. Thus they are really 2D extruded shapes. Portals are just simple rectangles which can be positioned, rotated, and scaled like any other object.

Sectors and Portals share the &#39;Portal&#39; tab in the editor, and then there are two subtabs: &#39;Portals!&#39;, and &#39;Sectors!&#39;. Starting with Sectors, you hit the Sector sub-tab to go into Sector mode, which allows you to create new Sectors and select and modify existing ones. You hit &#39;Place&#39; under Brush Mode to go into Sector creation mode. In this mode each mouse click will create a new point along the sector boundary. You can click points around the boundary in clockwise or counter-clockwise order as suits your preference. Its important to create a boundary which fully contains any objects you want to associate with the Sector. This is important and must be re-iterated: make your Sector conservative - overly large - ensure that any object geometry you want inside the Sector is fully contained in the boundary you create. After you place the boundary points in 2D, you can adjust the floor and height values by punching numbers in the appropriate tabs. If you make a mistake, you can just delete the Sector and start over again. Or you can use Move Points mode to edit existing points - click and drag on the bottom vertex. Once you are happy with your Sector, use the Attach Objects mode to associate objects with it. Just click on any objects you want to add, and right click to remove an object from the Sector. You can also use the &#39;Auto Add Objs&#39; button to automatically interesect the Sector with scene objects and add any that are overlap the Sector. The &#39;Detach All&#39; button empties the Sector.

Portals are placed like most other objects in ZeroEdit, and use the same controls for rotation, translation, and scaling operations. When placing Portals, its important that the Portal is properly scaled to be large enough to fully enclose the opening it represents. The Portal must be overly large - large enough to completely block off the next Sector from view. Once you have placed, rotated, and sized your Portal correctly, you need to associate it with Sectors. You use the &#39;Attach Sectors&#39; button, and then use the left and middle mouse buttons to select the left and right Sectors associated with the Portal. The right mouse button unassociates a Sector. The two Sectors will be color coded red and green.

### Notes:

- You dont need to be exact with your placement of Sectors and Portals - just be conservative - they need to be large enough to avoid errors. Don&#39;t go overboard - gigantic Sectors and Portals won&#39;t give your level a performance boost.

- There is a default Sector called the World which is useful for outdoor levels that have some indoor sections. You dont need to make a gigantic enclosing Sector for the outside - just make Sectors for your indoor sections of the level. The Portals that connect to the outside region just need to be associated with one Sector. A missing link for a Portal is interpreted as a link to the World Sector.

- Be careful not to use an excessive amount of vertices to define your Sector boundary. If you are using more than 20, you probably going overboard and should approximate the boundary with a simpler shape. The dynamic tests which determine which Sector a moving object is in are NOT optimized for complex boundaries with many vertices.

Future Enhancements:

Here are some planned improvements that you may also want to be aware of as far as they effect your design:

- Doors - I plan to associate Doors with Portals automatically, and when a Door closes, it will disable the associated Portal. This will give an additional speedup for levels that have many doors which are usually closed.

- AI - The unit AI gets lets CPU time for distant units, and we may also down-prioritize AI CPU time for units that are occluded by the Portal system. This could give a further speedup, we just need be careful it doesnt introduce any strange gameplay errors.