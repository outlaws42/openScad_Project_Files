/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 200;

/* [Box Container Properties] */
socket_hole_dia = 16;      // .63"
base_thickness = 5.969;    //.235"
base_width = 105.156;      // 4.140"
base_length = 19.05;       // .750"
corner_rad = 2;            // .078"
mount_hole_dia = 3;        // .118"
mount_plate_length = 25.4; // 1.0"
mount_plate_width = 25.4;  // 1.0"

/* [Tapered Arm Properties] */
tapered_arm_length = 38.1; // 1.5"
tapered_arm_width = 25.4;  // 1.0
big_end_taper = 1; // This is a scale so 1 would be same as thickness. greater then 1 would be bigger then thickeness. <
// 1 would be smaller then thickeness
small_end_taper = .2; // This is a scale so 1 would be same as thickness. greater then 1 would be bigger then
// thickeness. < 1 would be smaller then thickeness

// Tapered Arm Left
translate([
    (base_width / 2) - (tapered_arm_width / 2) - corner_rad,
    -base_length / 2,
    base_thickness / 2,
]) rotate([ 90, 0, 0 ])

    TaperCube(X_Dim = tapered_arm_width, Y_Dim = base_thickness, Z_Dim = tapered_arm_length);

// Tapered Arm Right
translate([ -(base_width / 2) + (tapered_arm_width / 2) + corner_rad, -base_length / 2, base_thickness / 2 ])
    rotate([ 90, 0, 0 ]) TaperCube(X_Dim = tapered_arm_width, Y_Dim = base_thickness, Z_Dim = tapered_arm_length);

// Base
RadCube(X_Dim = base_width, Y_Dim = base_length, Z_Dim = base_thickness, Corner_Rad = corner_rad);

// Mount Plate
translate([
    0,
    base_length / 2 - base_thickness / 2,
    base_thickness / 2,
])
{
    difference()
    {
        RadCube(X_Dim = mount_plate_width, Y_Dim = base_thickness, Z_Dim = mount_plate_length, Corner_Rad = 1);
        translate([ 0, 0, (base_thickness / 2) + (mount_plate_length / 2) - mount_hole_dia ]) rotate([ 90, 0, 0 ])
            cylinder(h = 50, d = mount_hole_dia, center = true);
    }
}

// Modules
module TaperCube(X_Dim, Y_Dim, Z_Dim, Taper_Big = 1, Small_Taper = .2, Center = true, )
{
    difference()
    {
        translate([ 0, -2.39, 0 ])
            linear_extrude(height = Z_Dim, scale = [ Taper_Big, Small_Taper ]) // flattend tapered rod .093/.1642
            square(
                [
                    X_Dim,
                    Y_Dim,
                ],
                center = Center);

        translate([ 0, -base_thickness, base_length ])
            cube([ tapered_arm_width, base_thickness, tapered_arm_length ], center = true);
    }
}

module RadCube(X_Dim, Y_Dim, Z_Dim, Corner_Rad = 0, Center = true)
{
    linear_extrude(height = Z_Dim) offset(r = Corner_Rad) square(
        [
            X_Dim - (Corner_Rad * 2),
            Y_Dim - (Corner_Rad * 2),
        ],
        center = Center);
}