// This file requires "/roundcube.scad" modules file.
include <Module_Collection.scad>;

/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Main Plate Properties] */

Length = 80.264; // 80.264 3.160
Width = 81.026; // 81.026  3.190
Height = 3.048;

/* [Switch Hole Properties] */

Switch_Length = 36.576; // 1.440
Switch_Width = 21.209; // .835"
Switch_Height = Height+5;

/* [Screw Hole Properties] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 5.715;
Amount_Of_Screw_Holes = 2;
Chamfer_Adjust = 3.5;

//Plate_Properties();
difference(){
cuberad(
        Length, 
        Width, 
        Height,
        7.62,
        "corner"
        );
 
color("red" )
cube([ 
        Switch_Width, 
        Switch_Length, 
        Switch_Height ],
         center = true);  
Holes();
};

module Holes(){
 translate([ 68.58/ 2 , 69.342/2, 0])
color("green")
            cylinder(h=Height* 2,
                     d = Screw_Hole_Diameter,
                     center = true);
translate([ -68.58/ 2 , 69.342/2, 0])
color("green")
            cylinder(h=Height* 2,
                     d = Screw_Hole_Diameter,
                     center = true);
translate([ -68.58/ 2 , -69.342/2, 0])
color("green")
            cylinder(h=Height* 2,
                     d = Screw_Hole_Diameter,
                     center = true);
translate([ 68.58/ 2 , -69.342/2, 0])
color("green")
            cylinder(h=Height* 2,
                     d = Screw_Hole_Diameter,
                     center = true);
}

module Plate_Properties(){
    // Outside Dimensions
    cube([ 
        Length, 
        Width, 
        Height ],
         center = false);
   
    
}















