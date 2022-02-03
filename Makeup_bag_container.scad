// All units are in Milimeter
$fn = 100;

//Makeup bag container
bagLt = 203.2; // 8"
bagWt = 76.2; // 3"
bagHt = 50.8; // 2"
bagThickness = 2.54; // .10"
floorThickness = 6.3; //.25"
screwHole = 5.08; // .20"
chamferAdjust = 6.4;
screwHoleAmount = 3; // amount -1 

difference(){
  cube([
    bagLt+bagThickness*2,
    bagWt+bagThickness*2,
    bagHt
    ],
    center=false
  );
  // Inside Dimensions
  translate([bagThickness,bagThickness,bagThickness])
  cube([
    bagLt,
    bagWt,
    bagHt+50
    ],
    center=false
  );
  // Screw Hole
  for(x=[1:screwHoleAmount-1])
    screwHoleBox(x,bagWt,bagLt,bagWt,bagThickness,floorThickness);
  // Chamfer
  for(x=[1:screwHoleAmount-1])
    chamferBox(x,bagWt,bagLt,bagWt,bagThickness,floorThickness);
  

};

// Screw Hole
module screwHoleBox(
  xPos=0,
  yPos=0,
  boxL,
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

module chamferBox(
  xPos=0,
  yPos=0,
  boxL,boxW,
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
  

