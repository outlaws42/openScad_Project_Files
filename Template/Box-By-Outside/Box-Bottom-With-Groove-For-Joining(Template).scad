/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Length = 133.35;
Width = 131.762;
Fit = 0; //.889(.035") is a good fit for most 
Height = 127;  //241.3
Wall_Thickness = 4.762; // 4.762
Floor_Thickness = 6.3;

Groove_Width = 2.338; // 2.338
Groove_Depth = 6.3;

difference(){
Outside_Box();
Groove_Box();
};

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
        Floor_Thickness
    ])
        cube([ 
          Length-Wall_Thickness*2, 
          Width-Wall_Thickness*2, 
          Height], 
          center = false);
    
};
}

module Groove_Box(){
    
    // Center groove in the wall
    wall_center = Wall_Thickness/2-Groove_Width/2;
 
// Groove Square
// Outside Dimensions
color("red"){
translate([
    wall_center,
    wall_center,
    Height-Groove_Depth,
    ]) {   
difference(){
cube([ 
        Length-wall_center*2, 
        Width-wall_center*2,  
        Groove_Depth+1 
    ],
         center = false
);
//Inside Dimensions
translate([
Groove_Width,
Groove_Width,
-1,
])
cube([
 Length-Groove_Width*2-wall_center*2, 
 Width-Groove_Width*2-wall_center*2, 
Groove_Depth+3
],
center = false
); 
    
};
 };  
}; 
}
















