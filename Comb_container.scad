// All units are in Milimeter
$fn = 256;

//Comb/Pick Cylinder (Inside Dia)
combCylDia = 54.102; // 2.130"
combCylHt = 63.5; // 2.5"
combfit = .889; // .035"
combThickness = 2.54; // .100"
floorThickness = 6.3; //.25
screwHole = 5.08; // .20"
chamferAdjust = 5.0; 

// Comb/Pick Container
difference() { 
 cylinder(
   combCylHt+floorThickness,
   d=(combCylDia+combfit+(combThickness*2)),
   center=false
  );
  // Inside Dimensions
  translate([0,0,floorThickness])
  cylinder(
   combCylHt+floorThickness,
   d=combCylDia+combfit,
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
