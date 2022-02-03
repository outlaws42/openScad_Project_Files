/* [Resolution of Model (All Units in Millimeters)] */
$fn = 256;

// This will create a dust hood for collection

/* [Hose Fitting Settings] */
Hose_Fitting_OD_Big = 102.387;        // 4.031"
Hose_Fitting_OD_Small = 101;          // 3.976"
Hose_Fitting_Taper_Distance = 39.751; // 1.565"
Hose_Fitting_Wall_Thickness = 5.08;   // .200"
Hose_Fitting_Straight_Length = 6.35;  // .250"

/* [Sphere Settings] */
Half_Sphere_Radius = 76.2;         // 6" Diameter
Half_Sphere_Wall_Thickness = 5.08; // .200"

/* [Screw Hole Settings] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 4.75;

/* [Base Settings] */
Base_Thickness = 4.75; // .1875"
Base_Width = 196.85;   // 7.75"
Base_Length = 196.85;  // 7.75"

/* [Hidden] */
// Extra for ID extension
Inside_Diameter_Extension_Length = 2;

union()
{
    // Create ID in the fitting
    difference()
    {
        Fitting_OD(Hose_Fitting_Taper_Distance,
                   Hose_Fitting_OD_Small,
                   Hose_Fitting_OD_Big,
                   Hose_Fitting_Straight_Length,
                   Half_Sphere_Radius,
                   Base_Thickness,
                   false);
        // Inside Profile
        Fitting_ID(Hose_Fitting_Taper_Distance,
                   Hose_Fitting_OD_Big,
                   Hose_Fitting_OD_Small,
                   Hose_Fitting_Wall_Thickness,
                   Hose_Fitting_Straight_Length,
                   Inside_Diameter_Extension_Length,
                   Half_Sphere_Radius,
                   Base_Thickness,
                   false);
    }; // close difference for fitting

    // Screw holes in base if = true
    if (Screw_Holes_On == true) {
        difference()
        {
            Base(Base_Width,
                 Base_Thickness,
                 Base_Length,
                 Half_Sphere_Radius,
                 Half_Sphere_Wall_Thickness);

            Screw_Holes(
                Base_Width, Base_Thickness, Base_Length, Screw_Hole_Diameter);
        }; // difference screw holes in base
    }      // close  If  statement

    // else not 1 base without screw holes
    else {
        Base(Base_Width,
             Base_Thickness,
             Base_Length,
             Half_Sphere_Radius,
             Half_Sphere_Wall_Thickness);
    } // close else  statement

    // Plung ID of the fitting through the top of the sphere
    difference()
    {
        Half_Sphere(
            Half_Sphere_Radius, Half_Sphere_Wall_Thickness, Base_Thickness);
        Fitting_ID(Hose_Fitting_Taper_Distance,
                   Hose_Fitting_OD_Big,
                   Hose_Fitting_OD_Small,
                   Hose_Fitting_Wall_Thickness,
                   Hose_Fitting_Straight_Length,
                   Inside_Diameter_Extension_Length,
                   Half_Sphere_Radius,
                   Base_Thickness,
                   false);
    }; // close difference from fitting
};     // close  union

// OD of fitting definition
module
Fitting_OD(HF_Taper_Distance,
           HF_Small_OD,
           HF_Big_OD,
           HF_Straight_Length,
           HS_Radius,
           base_thickness,
           cntr = false)
{
    translate([ 0, 0, HS_Radius + base_thickness / 2 - 25 ])
        cylinder(HF_Straight_Length, d = HF_Big_OD, center = cntr);
    // OD taper section
    translate(
        [ 0, 0, HS_Radius + HF_Straight_Length + base_thickness / 2 - 25 ])
        cylinder(HF_Taper_Distance - HF_Straight_Length,
                 d1 = HF_Big_OD,
                 d2 = HF_Small_OD,
                 center = cntr);
};

// ID of fitting definition
module
Fitting_ID(HF_Taper_Distance,
           HF_Big_OD,
           HF_Small_OD,
           HF_Wall_Thickness,
           HF_Straight_Length,
           ID_Extension_Length,
           HS_Radius,
           base_thickness,
           cntr = false)
{
    translate([ 0, 0, HS_Radius + base_thickness / 2 - 28 ])
        cylinder(HF_Taper_Distance + HF_Straight_Length + ID_Extension_Length,
                 d1 = HF_Big_OD - (HF_Wall_Thickness * 2),
                 d2 = HF_Small_OD - (HF_Wall_Thickness * 2),
                 center = false);
};

// Screw holes definition
module
Screw_Holes(base_width, base_thickness, base_length, SH_Diameter)
{
    for (i = [-base_length / 2 + SH_Diameter:65:base_length / 2 - SH_Diameter])
        translate([ -base_width / 2 + SH_Diameter, i, -base_thickness / 2 ])
            cylinder(base_thickness * 2,
                     d1 = SH_Diameter,
                     d2 = SH_Diameter,
                     center = false);

    for (i = [-base_width / 2 + SH_Diameter:65:base_width / 2 - SH_Diameter])
        translate([ i, -base_length / 2 + SH_Diameter, -base_thickness / 2 ])
            cylinder(base_thickness * 2,
                     d1 = SH_Diameter,
                     d2 = SH_Diameter,
                     center = false);

    for (i = [-base_length / 2 + SH_Diameter:65:base_length / 2 - SH_Diameter])
        translate([ base_width / 2 - SH_Diameter, i, -base_thickness / 2 ])
            cylinder(base_thickness * 2,
                     d1 = SH_Diameter,
                     d2 = SH_Diameter,
                     center = false);

    for (i = [-base_width / 2 + SH_Diameter:60:base_width / 2 - SH_Diameter])
        translate([ i, base_length / 2 - SH_Diameter, -base_thickness / 2 ])
            cylinder(base_thickness * 2,
                     d1 = SH_Diameter,
                     d2 = SH_Diameter,
                     center = false);
};

// Sphere  definition
module
Half_Sphere(radius, wall_thickness, base_thickness)
{
    translate([ 0, 0, base_thickness / 2 ]) difference()
    {
        sphere(radius);
        translate([ 0, 0, -5.5 ]) sphere(radius - wall_thickness);
        translate([ 0, 0, -radius ]) cube(size = radius * 2, center = true);
    };
};

// Base definition with ID through the base for the sphere.
module
Base(base_width,
     base_thickness,
     base_length,
     radius,
     wall_thickness,
     cntr = true

)
{
    diff_cyl_len = 100;
    difference()
    {
        translate([ 0, 0, base_thickness / 2 ])
            cube([ base_width, base_length, base_thickness ], center = cntr);
        translate([ 0, 0, -diff_cyl_len / 2 + (base_thickness * 1.5) ])
            cylinder(diff_cyl_len,
                     r1 = radius - wall_thickness,
                     r2 = radius - wall_thickness,
                     center = true);
    };
};

















