// All units are in Milimeter
$fn = 256;

//Floss container
flossLt = 48.006; // 1.89"
flossWt = 14.732; // .580"
flossHt = 25.4; // Box 2.300", Container Depth 1.0"
flossfit = .889; // .035"
flossThickness = 2.54; // .100"

// Floss container 
difference(){
  cube([
    (flossLt+flossfit+(flossThickness*2)),
    (flossWt+flossfit+(flossThickness*2)),
    flossHt
    ],
    center=false
  );
  translate([flossThickness,flossThickness,flossThickness]){
    cube(
      [flossLt+flossfit,
      flossWt+flossfit,
      flossHt],
      center=false
    );
  };

};