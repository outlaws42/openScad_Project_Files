// All units are in Milimeter
$fn = 256;

//Brushes Cylinder (Inside Dia)
brushCylDia = 76.2; // 3"
brushCylHt = 101.6; // 4.0"
brushfit = .889; // .035"
brushThickness = 2.54; // .100"
floorThickness = 6.3; //.25"
screwHole = 5.08; // .20"
chamferAdjust = 5.0; 

// Brush Container
difference() { 
 cylinder(
   brushCylHt,
   d=(brushCylDia+brushfit+(brushThickness*2)),
   center=false
  );
  // Inside Dimensions
  translate([0,0,floorThickness])
  cylinder(
   brushCylHt+floorThickness,
   d=brushCylDia+brushfit,
   center=false
  );
  // Screw Hole
  translate([0,0,-floorThickness])
  cylinder(
   150,
   d=screwHole,
   center=false
  );
  // Chamfer
  translate([0,0,floorThickness-chamferAdjust])
  cylinder(
   5,
   d1=1,
   d2=10,
   center=false
  );
};
