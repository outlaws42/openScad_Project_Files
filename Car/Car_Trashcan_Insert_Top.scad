/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Length = 133.35;
Width = 131.762;
Fit = .889; //.889(.035") is a good fit for most 
Height = 114.3;  //241.3
Wall_Thickness = 4.762;
Floor_Thickness = 6.3;

/* [Tab Properties] */
Tab_Width = 2.338;
Groove_Depth = 6.3;

/* [Hidden] */
tab_width = Tab_Width - Fit;

Outside_Box();
Groove_Box();

module Outside_Box(){
  difference()
{   
    // Outside Dimensions
    cube([ 
        Length, 
        Width, 
        Height ],
         center = false);
    // Inside Dimensions
    translate([ 
        Wall_Thickness, 
        Wall_Thickness, 
       -1
    ])
        cube([ 
          Length-Wall_Thickness*2, 
          Width-Wall_Thickness*2, 
          Height+3
    ], 
          center = false);
    
};
}

module Groove_Box(){
 
// Groove Square
// Outside Dimensions
color("red"){
translate([
    Wall_Thickness/2-tab_width/2,
    Wall_Thickness/2-tab_width/2,
    Height-1,
    ]) {   
difference(){
cube([ 
        Length-(tab_width/2)-(Wall_Thickness/2), 
        Width-(tab_width/2)-(Wall_Thickness/2), 
        Groove_Depth 
    ],
         center = false
);
//Inside Dimensions
translate([
tab_width,
tab_width,
-1,
])
cube([
 Length-Wall_Thickness-tab_width, 
 Width-Wall_Thickness-tab_width, 
Groove_Depth+3
],
center = false
); 
    
};
 };  
}; 
}
















