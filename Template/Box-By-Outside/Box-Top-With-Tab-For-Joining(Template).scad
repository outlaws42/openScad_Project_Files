/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Length = 133.35;
Width = 131.762;
Fit = .508; //.889(.035") is a good fit for most 
Height = 114.3;  //241.3
Wall_Thickness = 4.762;  // 4.762
Floor_Thickness = 6.3;

/* [Tab Properties] */
Tab_Width = 2.338;
Tab_Height = 6.3;

/* [Hidden] */
tab_width = Tab_Width - Fit;

Outside_Box();
Tab_Box();

module Outside_Box(){
  difference()
{   
    // Outside Dimensions
    cube([ 
        Length, 
        Width, 
        Height
    ],
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

module Tab_Box(){
    
 // Center tab in the  wall   
 wall_center = Wall_Thickness/2-tab_width/2;
    
// Tab Square
// Outside Dimensions
color("red"){
translate([
    wall_center,
    wall_center,
    Height-1,
    ]) {   
difference(){
cube([ 
        Length-wall_center*2, 
        Width-wall_center*2, 
        Tab_Height
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
 Length-tab_width*2-wall_center*2, 
 Width-tab_width*2-wall_center*2, 
Tab_Height+3
],
center = false
); 
    
};
 };  
}; 
}
















