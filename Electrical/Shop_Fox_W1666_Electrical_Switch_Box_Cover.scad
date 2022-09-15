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
Screw_Hole_Diameter = 5.715; // .225"

//Plate_Properties();
difference(){
cuberad(
        Length, 
        Width, 
        Height,
        7.62*2,
        "corner"
        );
 
color("red" )
cube([ 
        Switch_Width, 
        Switch_Length, 
        Switch_Height 
    ],
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

module cuberad(xsize=10,ysize=10,zsize=10,diameter=2, type="all"){
    // Example cuberad
    // cuberad(width,length,height,diameter of radius)
    if (type=="all"){
    minkowski() {
        cube([xsize-diameter/2,ysize-diameter/2,zsize-diameter/2],center=true);
        sphere(d=diameter);
        }
        
    }
    else if (type=="corner"){
    minkowski() {
        cube([xsize-diameter,ysize-diameter,zsize] ,center=true);
        cylinder(d=diameter);
        }
        
    }
}















