// All units are in Milimeter
$fn = 256;

//Q-tip container
qtLt = 73.025; // 2.875"
qtWt = 19.05; // .75"
qtHt = 25.4; // Box 2.875", Container Depth 1.0" 
qtfit = .889; // .035"
qtThickness = 2.54; // .100"

// Q-Tip container 
difference(){
  cube([
    (qtLt+qtfit+(qtThickness*2)),
    (qtWt+qtfit+(qtThickness*2)),
    qtHt
    ],
    center=false
    );
  translate([qtThickness,qtThickness,qtThickness]){
    cube([
      qtLt+qtfit,
      qtWt+qtfit,
      qtHt
      ],
      center=false
      );
  };
  

};