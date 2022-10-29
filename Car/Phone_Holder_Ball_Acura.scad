/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 200;

/* [Sphere Properties] */
sphere_dia = 16.891; // .665"

/* [Post Properties Properties] */
post_dia = 7.62; // .300"
post_length = 5; // .197

/* [Base Properties] */
base_dia = 12.7;    // .500"
base_length = 8;    // .315
Tab_Dia = 2.819;    // .112"
Tab_Length = 6.096; // .240"

/* [Hidden] */
sphere_post_adjust = 2;
flat_height = 5;
flat_adjust = 2;

// Sphere
difference()
{
    sphere(d = sphere_dia);
    translate([ 0, 0, -(flat_height / 2 + sphere_dia / 2 - flat_adjust) ]) cube([ 20, 20, flat_height ], center = true);
}
// Post
translate([ 0, 0, sphere_dia / 2 - sphere_post_adjust ]) cylinder(h = post_length, d = post_dia);

// Base
translate([ 0, 0, sphere_dia / 2 + post_length - sphere_post_adjust ])
    cylinder(h = base_length, d1 = post_dia, d2 = base_dia);

// Tab
translate([ 0, 0, sphere_dia / 2 + post_length + base_length - sphere_post_adjust ])
    cylinder(h = Tab_Length, d = Tab_Dia);