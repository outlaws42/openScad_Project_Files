// All units are in Milimeter
$fn = 256;

//Blow Dryer Cylinder (Inside Dia)
dryerCylDia = 60.452; //2.380"
dryerCylHt = 101.6; // 4"
dryerThickness = 2.54; // .100"
floorThickness = 6.3; //.5
screwHole = 5.08; // .20"
chamferAdjust = 3.5; // .137"

// Hair Dryer Container
difference() { 
 cylinder(
   dryerCylHt,
   d=dryerCylDia+(dryerThickness*2),
   center=false
  );
   // Inside Dimensions
  translate([0,0,floorThickness])
  cylinder(
   dryerCylHt+floorThickness,
   d=dryerCylDia,
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
