// All units are in Milimeter
$fn = 256;

//bottle box 4 container
bb4Lt = 131.572; // 5.180"
bb4Wt = 78.994; // 3.110"
bb4Ht = 50.8; // 2.0"
bb4Thickness = 2.54; // .100"
floorThickness = 6.3; //.5"
screwHole = 5.08; // .20"
chamferAdjust = 6.7; // .137"
screwHoleAmount = 3; // amount -1 

//Bottle box 4 container 
difference(){
  cube([
    bb4Lt+bb4Thickness*2,
    bb4Wt+bb4Thickness*2,
    bb4Ht
    ],
    center=false
  );
  // Inside Dimensions
  translate([bb4Thickness,bb4Thickness,bb4Thickness])
  cube([
    bb4Lt,
    bb4Wt,
    bb4Ht
    ],
    center=false
  );
  // Screw Hole
  for(x=[1:screwHoleAmount-1])
    screwHoleBox(x,bb4Wt,bb4Lt,bb4Wt,bb4Thickness,floorThickness);
  // Chamfer
  for(x=[1:screwHoleAmount-1])
    chamferHoleBox(x,bb4Wt,bb4Lt,bb4Wt,bb4Thickness,floorThickness);
  

};
  

// Screw Hole
module screwHoleBox(
  xPos,
  yPos,boxL,
  boxW,
  holeDia=5.08,
  wallThickness=2.54,
  bottomThickness=6.3){
  translate([
    (wallThickness)+(holeDia/2)+xPos*(boxL/screwHoleAmount),
    (wallThickness)+(holeDia/2)+yPos/2,
    -bottomThickness])
  cylinder(
   150,
   d=holeDia,
   center=false
  );
}

module chamferHoleBox(
  xPos,
  yPos,
  boxL,
  boxW,
  holeDia=5.08,
  wallThickness=2.54,
  bottomThickness=6.3){
  translate([
    (wallThickness)+(holeDia/2)+xPos*(boxL/screwHoleAmount),
    (wallThickness)+(holeDia/2)+yPos/2,
    bottomThickness-chamferAdjust])
  cylinder(
   5,
   d1=1,
   d2=10,
   center=false
  );
}
