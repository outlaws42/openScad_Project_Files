/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Cylinder Properties (Inside Diameter)] */
Diameter = 54.102;
Height = 6.35;
Wall_Thickness = 2.54;
Floor_Thickness = 6.3;

/* [Screw Hole Properties] */
Screw_Hole_On = false;
Screw_Hole_Diameter = 5.08;
Chamfer_Adjust = 3.5; 

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
  if(Screw_Hole_On==true) {
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

  }
  
};


