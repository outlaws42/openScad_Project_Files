// This file requires "Dust-Collection-Modules/helpers.scad" modules file.
include <Dust-Collection-Modules/helpers.scad>;

/* [Resolution of Model (All Units in Millimeters)] */
$fn = 256;

// This will create a dust hood for collection

/* [Fitting Settings] */
Fitting_OD_Big = 102.387;
Fitting_OD_Small = 101;
Fitting_Taper_Distance = 33.401; 
Fitting_Wall_Thickness = 5.08; 
Fitting_Straight_Length = 35.4; 

/* [Screw Hole Settings] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 4.75;

/* [Base Settings] */
Base_Thickness = 4.75; 
Base_Width = 137.92;   
Base_Length = 137.95;  

/* [Hidden] */
// Extra for ID extension
Inside_Diameter_Extension_Length = 2;


OD_Fitting(Fitting_Taper_Distance,
                   Fitting_OD_Big,
                   Fitting_OD_Small,
                   Fitting_Wall_Thickness,
                   Fitting_Straight_Length,
                   Inside_Diameter_Extension_Length,
                   false);

rotate([0,180,0]){
  OD_Fitting(Fitting_Taper_Distance,
                   Fitting_OD_Big,
                   Fitting_OD_Small,
                   Fitting_Wall_Thickness,
                   Fitting_Straight_Length,
                   Inside_Diameter_Extension_Length,
                   false);
}

        difference()
        {
            Base(Base_Width,
             Base_Thickness,
             Base_Length,
             Fitting_Wall_Thickness,
             Fitting_OD_Big
             );
            if (Screw_Holes_On == true) 
            Screw_Holes_Square_Pattern(
                Base_Width, 
                Base_Thickness, 
                Base_Length, 
                Screw_Hole_Diameter
                );

        }; // difference screw holes in base
 
// Modules used

// OD_Fitting(
    // fittingTaperDistance,
    // fittingODBig,
    // fittingODSmall,
    // fittingWallThickness,
    // fittingStraightLength,
    // idExtensionLength,)


// Screw_Holes_Square_Pattern(yAxis, thickness, xAxis, screwHoleDiameter)

// Base(baseWidth,
//      baseThickness,
//      baseLength,
//      fittingWallThickness,
//      fittingODBig,
//      cntr = true
// )


















