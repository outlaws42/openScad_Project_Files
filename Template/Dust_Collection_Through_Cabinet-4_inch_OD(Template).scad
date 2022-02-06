use <Dust_Collection_Modules.scad>

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

    // Screw holes in base if = true
    if (Screw_Holes_On == true) {
        difference()
        {
            Base(Base_Width,
             Base_Thickness,
             Base_Length,
             Fitting_Wall_Thickness,
             Fitting_OD_Big
             );
            
            Screw_Holes(
                Base_Width, Base_Thickness, Base_Length, Screw_Hole_Diameter);
        }; // difference screw holes in base
    }      // close  If  statement

    // else not 1 base without screw holes
    else {
        Base(Base_Width,
             Base_Thickness,
             Base_Length,
             Fitting_Wall_Thickness,
             Fitting_OD_Big
             );
    } // close else  statement

// // OD Fitting module. A hose or another fitting goes over
// // this fitting.
// module Fitting(
//   fittingTaperDistance,
//   fittingODBig,
//   fittingODSmall,
//   fittingWallThickness,
//   fittingStraightLength,
//   idExtensionLength,
//   baseThickness,
//   cntr = false
// ){
  
//   difference(){
//     // OD Straight Section
//     translate([ 0, 0,0])
//         cylinder(
//           h=fittingStraightLength, 
//           d = fittingODBig, 
//           center = cntr);
//     // ID Straight Section    
//     translate([ 0, 0,-idExtensionLength])
//         cylinder(
//           h=fittingStraightLength + baseThickness, 
//           d = fittingODBig-(fittingWallThickness*2), 
//           center = cntr);
//   }
//   difference(){
//     // OD taper section
//     translate(
//         [ 0, 0, fittingStraightLength ])
//         cylinder(h=fittingTaperDistance,
//                  d1 = fittingODBig,
//                  d2 = fittingODSmall,
//                  center = cntr);
//     // ID taper section
//     translate([ 0, 0, fittingStraightLength-idExtensionLength])
//         cylinder(
//             h=fittingTaperDistance + idExtensionLength+1,
//             d1 = fittingODBig - (fittingWallThickness * 2),
//             d2 = fittingODSmall- (fittingWallThickness * 2),
//             center = false);

//   }

    
// };


// Screw holes definition
module
Screw_Holes(baseWidth, baseThickness, baseLength, screwHoleDiameter)
{
    for (i = [-baseLength / 2 + screwHoleDiameter:65:baseLength / 2 - screwHoleDiameter])
        translate([ -baseWidth / 2 + screwHoleDiameter, i, -baseThickness / 2 ])
            cylinder(baseThickness * 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-baseWidth / 2 + screwHoleDiameter:65:baseWidth / 2 - screwHoleDiameter])
        translate([ i, -baseLength / 2 + screwHoleDiameter, -baseThickness / 2 ])
            cylinder(baseThickness * 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-baseLength / 2 + screwHoleDiameter:65:baseLength / 2 - screwHoleDiameter])
        translate([ baseWidth / 2 - screwHoleDiameter, i, -baseThickness / 2 ])
            cylinder(baseThickness * 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-baseWidth / 2 + screwHoleDiameter:60:baseWidth / 2 - screwHoleDiameter])
        translate([ i, baseLength / 2 - screwHoleDiameter, -baseThickness / 2 ])
            cylinder(baseThickness * 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);
};


// // Base definition with ID through the base.
// module
// Base(baseWidth,
//      baseThickness,
//      baseLength,
//      fittingWallThickness,
//      fittingODBig,
//      cntr = true

// )
// {
//     difference()
//     {
//         translate([ 0, 0, baseThickness / 2 ])
//             cube([ baseWidth, baseLength, baseThickness ], center = cntr);
//         // translate([ 0, 0, 0 ])
//         //     cylinder(
//         //              h=baseThickness,
//         //              d1 = baseLength,
//         //              d2 = baseLength,
//         //              center = false);
//         translate([ 0, 0,-2 ])
//             cylinder(
//                      h=baseThickness*2,
//                      d1 = fittingODBig - (fittingWallThickness*2),
//                      d2 = fittingODBig - (fittingWallThickness*2),
//                      center = false);
//     };
    
// };

















