/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Cylinder (Inside Diameter)] */
Diameter = 56.134; // 2.210"
Height = 101.6; // 4"
Wall_Thickness = 2.54; // .100"
Floor_Thickness = 6.3; //.25"
Screw_Hole_Diameter = 5.08; // .20"
Chamfer_Adjust = 3.5; // .137 

// Outside Dimensions
difference() { 
 cylinder(
   h=Height+Floor_Thickness,
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
   h=Floor_Thickness+30,
   d=Screw_Hole_Diameter,
   center=false
  );
  // Chamfer
  translate([0,0,Floor_Thickness-Chamfer_Adjust])
  cylinder(
   h=Screw_Hole_Diameter,
   d1=Screw_Hole_Diameter,
   d2=Screw_Hole_Diameter*2,
   center=false
  );
};


