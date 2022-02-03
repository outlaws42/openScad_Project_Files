// All units are in Milimeter
$fn = 256;

//bottle box 5 container
bb5Lt = 154.94; // 6.1"
bb5Wt = 40.64; // 1.6"
bb5Ht = 50.8; // 2.0"
bb5Thickness = 2.54; // .100"
floorThickness = 6.3; //.5"
screwHole = 5.08; // .20"
chamferAdjust = 6.0; // .137"
screwHoleAmount = 3; // amount -1 

//Bottle box 5 container 

difference(){
  cube([
    bb5Lt+bb5Thickness*2,
    bb5Wt+bb5Thickness*2,
    bb5Ht], 
    center=false
    );
  // Inside  
  translate([bb5Thickness,bb5Thickness,bb5Thickness])
  cube([
    bb5Lt,
    bb5Wt,
    bb5Ht
    ],
    center=false
  );
   // Screw Hole
  for(x=[1:screwHoleAmount-1])
    screwHoleBox(x,bb5Wt,bb5Lt,bb5Wt,bb5Thickness,floorThickness);
  // Chamfer
  for(x=[1:screwHoleAmount-1])
    chamferHoleBox(x,bb5Wt,bb5Lt,bb5Wt,bb5Thickness,floorThickness);
 
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