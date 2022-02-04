/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container (Inside Diameter)] */
Length = 48.00; // 1.89"
Width = 14.732; // .580"
Height = 25.4; // 1.0"
Wall_Thickness = 2.54; // .100"
Fit = .889; // .035

  // Box Container No Screws 
difference(){
  cube([
    (Length +Fit+(Wall_Thickness*2)),
    (Width+Fit+(Wall_Thickness*2)),
    Height
    ],
    center=false
  );
  translate([Wall_Thickness,Wall_Thickness,Wall_Thickness]){
    cube(
      [Length+Fit,
      Width+Fit,
      Height],
      center=false
    );
  };

};