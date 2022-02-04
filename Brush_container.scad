/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Cylinder (Inside Diameter)] */
Diameter = 76.2; // 3"
Height = 101.6; // 4.0"
Wall_Thickness = 2.54; // .100"
Floor_Thickness = 6.3; //.25"
Screw_Hole_Diameter = 5.08; // .20"
Chamfer_Adjust = 5.0; 

// Container
difference() { 
 cylinder(
   Height,
   d=(Diameter+(Wall_Thickness*2)),
   center=false
  );
  // Inside Dimensions
  translate([0,0,Floor_Thickness])
  cylinder(
   Height+Floor_Thickness,
   d=Diameter,
   center=false
  );
  // Screw Hole
  translate([0,0,-Floor_Thickness])
  cylinder(
   150,
   d=Screw_Hole_Diameter,
   center=false
  );
  // Chamfer
  translate([0,0,Floor_Thickness-Chamfer_Adjust])
  cylinder(
   5,
   d1=1,
   d2=Screw_Hole_Diameter*2,
   center=false
  );
};
