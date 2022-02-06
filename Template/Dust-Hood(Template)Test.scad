use <Dust_Collection_Modules.scad>

/* [Resolution of Model (All Units in Millimeters)] */
$fn = 256;

// This will create a dust hood for collection

/* [Hose Fitting Settings] */
Hose_Fitting_OD_Big = 102.387;        
Hose_Fitting_OD_Small = 101;          
Hose_Fitting_Taper_Distance = 39.751; 
Hose_Fitting_Wall_Thickness = 5.08;   
Hose_Fitting_Straight_Length = 6.35;  

/* [Sphere Settings] */
Half_Sphere_Radius = 76.2;         
Half_Sphere_Wall_Thickness = 5.08; 

/* [Screw Hole Settings] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 4.75;

/* [Base Settings] */
Base_Thickness = 4.75; 
Base_Width = 196.85;   
Base_Length = 196.85;  

/* [Hidden] */
// Extra for ID extension
Inside_Diameter_Extension_Length = 2;

 
// Screw holes in base if = true
if (Screw_Holes_On == true) {
    difference()
    {
        // Imported from Dust_Collection_Modules.scad
        Base(Base_Width,
                Base_Thickness,
                Base_Length,
                Half_Sphere_Wall_Thickness,
                Half_Sphere_Radius*2
                );

        Screw_Holes_Square_Pattern(
            Base_Width, Base_Thickness, Base_Length, Screw_Hole_Diameter);
    }; // difference screw holes in base
}      // close  If  statement

// else not 1 base without screw holes
else {
    // Imported from Dust_Collection_Modules.scad
    Base(Base_Width,
            Base_Thickness,
            Base_Length,
            Half_Sphere_Wall_Thickness,
            Half_Sphere_Radius*2
            );
} // close else  statement

// Plung ID of the fitting through the top of the sphere
difference()
{
    Half_Sphere(
        Half_Sphere_Radius, Half_Sphere_Wall_Thickness);
    translate([ 0, 0,0 ])
    cylinder(
        h=Half_Sphere_Radius + Inside_Diameter_Extension_Length ,
        d = Hose_Fitting_OD_Big - (Hose_Fitting_Wall_Thickness * 2),
        center = false);
}; // close difference from fitting

translate([0,0,Half_Sphere_Radius+Base_Thickness/2-25])
// Imported from Dust_Collection_Modules.scad
OD_Fitting(
Hose_Fitting_Taper_Distance,
Hose_Fitting_OD_Big,
Hose_Fitting_OD_Small,
Hose_Fitting_Wall_Thickness,
Hose_Fitting_Straight_Length,
Inside_Diameter_Extension_Length,
false
);

// Modules used

// OD_Fitting(
    // fittingTaperDistance,
    // fittingODBig,
    // fittingODSmall,
    // fittingWallThickness,
    // fittingStraightLength,
    // idExtensionLength,)

// Half_Sphere(radius, wallThickness)

// Screw_Holes_Square_Pattern(yAxis, thickness, xAxis, screwHoleDiameter)

// Base(baseWidth,
//      baseThickness,
//      baseLength,
//      fittingWallThickness,
//      fittingODBig,
//      cntr = true
// )


















