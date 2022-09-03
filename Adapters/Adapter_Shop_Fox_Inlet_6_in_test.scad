// This file requires "Dust-Collection-Modules/helpers.scad" modules file.
include <Dust-Collection-Modules/helpers.scad>;

// All measurements are in metric

/* [Model Resolution (All Measurments are in metric)] */
$fn = 256;

/* [Wall Thickness] */
thickness = 4.25; // .167"

/* [Bottom Section] */
bottom_inside_diameter = 150.368; // 5.92"
bottom_length = 45;             // 1.772"


/* [Hidden] */
// Extra for ID extension

// Bottom Section
difference()
{
    outside(bottom_inside_diameter, bottom_length, thickness);
    inside(bottom_inside_diameter, bottom_length);
}

// Middle Section
//difference()
//{
//    translate([ 0, 0, bottom_length ]) taper_outside(
//        bottom_inside_diameter, top_inside_diameter, middle_length, thickness);
//    translate([ 0, 0, bottom_length ]) taper_inside(
//        bottom_inside_diameter, top_inside_diameter, middle_length);
//}

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
