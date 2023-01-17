// This model uses the "Chamfers-for-OpenSCAD" library
// You can get it here https://freesoft.dev/program/50741079
include <Chamfers-for-OpenSCAD/Chamfer.scad>;

/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Size Properties] */

ID_Dia = 106.68;         // 4.2"
Bracket_Width = 25.4;    // 1.0"
Wall_Thickness = 10.16;  //.4"
Mount_Tab_Length = 25.4; // 1"
Hole_Dia = 5.08;         //.200"

/* [Hidden] */
Hole_Location_Left = -(ID_Dia + Wall_Thickness + (Mount_Tab_Length)) / 2;
Hole_Location_Right = (ID_Dia + Wall_Thickness + (Mount_Tab_Length)) / 2;

// translate([ (id_dia + wall_thickness) / 2, -(id_dia + wall_thickness) / 2, 0 ])

difference()
{
    // Mount and Bracket OD
    union()
    {
        // Bracket OD
        cylinder(h = Bracket_Width, d = ID_Dia + Wall_Thickness, center = true);

        color(c = [ 1, 0, 0 ], alpha = .5) translate([ 0, (ID_Dia + Wall_Thickness) / 4, 0 ])
            cube([ ID_Dia + Wall_Thickness, (ID_Dia + Wall_Thickness) / 2, Bracket_Width ], center = true);
        // Mount
        difference()
        {
            Mount();
            Holes(Hole_Location_Right);
            Holes(Hole_Location_Left);
        }
    }
    // Bracket ID
    union()
    {
        cylinder(h = Bracket_Width + 10, d = ID_Dia, center = true);

        color(c = [ 1, 0, 0 ], alpha = .5) translate([ 0, (ID_Dia + Wall_Thickness + 5) / 4, 0 ])
            cube([ ID_Dia, (ID_Dia + Wall_Thickness) / 2, Bracket_Width + 10 ], center = true);
    }
}

module Holes(hole_location, ){translate([ hole_location, 0, 0 ]){
    rotate(a = 90, v = [ 90, 0, 0 ]) cylinder(h = Wall_Thickness + 500, d = Hole_Dia, center = true);
}
}
;

module Mount()
{

    color(c = [ 0, 1, 0 ], alpha = .5) translate([ 0, (ID_Dia + Wall_Thickness) / 2 - (Wall_Thickness / 2), 0 ])
        cube([ ID_Dia + Wall_Thickness + (25.4 * 2), Wall_Thickness, Bracket_Width ], center = true);
};