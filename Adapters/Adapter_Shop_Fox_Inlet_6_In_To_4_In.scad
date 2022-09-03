// This file requires "Dust-Collection-Modules/helpers.scad" modules file.
include <Dust-Collection-Modules/helpers.scad>;

// All measurements are in metric

/* [Model Resolution (All Measurments are in metric)] */
$fn = 256;

/* [Wall Thickness Bottom */
thickness = 4.25; // .167"

/* [Bottom Section] */
bottom_inside_diameter = 150.876; // 5.92"
bottom_length = 55;             // 2.165"

/* [Middle Section] */
middle_length = 40; // 1.575"

/* [Top Section] */
Fitting_OD_Big = 102.387; // 4.031
Fitting_OD_Small = 101; // 3.976
Fitting_Taper_Distance = 33.401; 
Fitting_Wall_Thickness = 2.54;  // .100
Fitting_Straight_Length = 35.4; 

//top_length = 45;            // 1.772"

/* [Hidden] */
// Extra for ID extension
top_inside_diameter = Fitting_OD_Big-Fitting_Wall_Thickness*2; 
Inside_Diameter_Extension_Length = 2;

// Top Section
translate([ 0, 0, bottom_length + middle_length ])
OD_Fitting(Fitting_Taper_Distance,
                   Fitting_OD_Big,
                   Fitting_OD_Small,
                   Fitting_Wall_Thickness,
                   Fitting_Straight_Length,
                   Inside_Diameter_Extension_Length,
                   false);

// Bottom Section
difference()
{
    outside(bottom_inside_diameter, bottom_length, thickness);
    inside(bottom_inside_diameter, bottom_length);
}

// Middle Section
difference()
{
    translate([ 0, 0, bottom_length ]) taper_outside(
        bottom_inside_diameter, top_inside_diameter, middle_length, thickness);
    translate([ 0, 0, bottom_length ]) taper_inside(
        bottom_inside_diameter, top_inside_diameter, middle_length);
}

// Top Section
//difference()
//{
 //   translate([ 0, 0, bottom_length + middle_length ])
 //       outside(top_inside_diameter, top_length, thickness);
 //   translate([ 0, 0, bottom_length + middle_length ])
 //       inside(top_inside_diameter, top_length);
//}

// Logic
module
outside(inside_dia, length, wall_thickness = 4.25)
{
    cylinder(d = inside_dia + (wall_thickness * 2), h = length);
}

module
inside(inside_dia, length)
{
    cylinder(d = inside_dia, h = length);
}

module
taper_outside(dia, dia2, length, wall_thickness = 4.25)
{
    cylinder(d1 = dia + (wall_thickness * 2),
             d2 = dia2 + (wall_thickness * 2),
             h = length);
}
module
taper_inside(dia, dia2, length)
{
    cylinder(d1 = dia, d2 = dia2, h = length);
}
