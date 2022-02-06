/* [Model Resolution (All Measurments in millimeters)] */
$fn = 256;

/* [Sweeper Settings (Fit Shop Vac Attachment Taper ID)] */
Outside_Diameter_Small_End = 56.769; // 2.235"
Outside_Diameter_Big_End = 58.42;    // 2.300"
Taper_Distance = 46.101;             // 1.815
Wall_Thickness = 2.54;               // .100
Straight_Length = 5.7;               // .224"

/* [Sweeper Settings (Fit Shark Hose ID)] */
Shark_Outside_Diameter_Small_End = 38.862; // 1.530"
Shark_Outside_Diameter_Big_End = 39.751;   // 1.565"
Shark_Taper_Distance = 39.751;             // 1.565
Shark_Wall_Thickness = 2.54;               // .100
Shark_Straight_Length = 6.35;              // .250"
Shark_Big_End_Fit = .254;                  // .01"
Shark_Small_End_Fit = .254;                // .01"

/* [Transition Settings] */
Transition_Taper_Length = 12.7;

/* [Hidden] */
// DON"T CHANGE (OD plus the fit added)
Shark_OD_Big_Fit = Shark_Outside_Diameter_Big_End + Shark_Big_End_Fit;
Shark_OD_Small_Fit = Shark_Outside_Diameter_Small_End + Shark_Small_End_Fit;

// Extra for ID extension
ID_Extension_Length = 5;

// OD Profile
difference()
{
    Adapter_OD(Taper_Distance,
               Outside_Diameter_Small_End,
               Outside_Diameter_Big_End,
               Straight_Length,
               Transition_Taper_Length,
               Shark_Taper_Distance,
               Shark_OD_Small_Fit,
               Shark_OD_Big_Fit,
               Shark_Straight_Length,
               false);
    // Inside Profile
    Adapter_ID(Taper_Distance,
               Outside_Diameter_Small_End,
               Outside_Diameter_Big_End,
               Straight_Length,
               Transition_Taper_Length,
               Shark_Taper_Distance,
               Shark_OD_Small_Fit,
               Shark_OD_Big_Fit,
               Shark_Wall_Thickness,
               Wall_Thickness,
               ID_Extension_Length,
               false);
};

module
Adapter_OD(taperDistance,
           outsideDiameterSmallEnd,
           outsideDiameterBigEnd,
           straightLength,
           transitionTaperLength,
           sharkTaperDistance,
           sharkODSmallFit,
           sharkODBigFit,
           sharkStraightLength,
           cntr = false)
{
    // OD taper section to fit attachment
    cylinder(taperDistance,
             d1 = outsideDiameterSmallEnd,
             d2 = outsideDiameterBigEnd,
             center = cntr);
    // Straight section at OD
    translate([ 0, 0, taperDistance ])
        cylinder(straightLength, d = outsideDiameterBigEnd, center = cntr);
    // Taper section to OD for fit CS
    translate([ 0, 0, taperDistance + straightLength ])
        cylinder(transitionTaperLength,
                 d1 = outsideDiameterBigEnd,
                 d2 = sharkODBigFit,
                 center = cntr);
    // Straight section at OD
    translate([ 0, 0, taperDistance + straightLength + transitionTaperLength ])
        cylinder(sharkStraightLength, d = sharkODBigFit, center = cntr);
    // OD taper section to fit Sweeper
    translate([
        0,
        0,
        taperDistance + straightLength + transitionTaperLength +
        sharkStraightLength
    ]) cylinder(sharkTaperDistance - sharkStraightLength,
                d1 = sharkODBigFit,
                d2 = sharkODSmallFit,
                center = cntr);
};

module
Adapter_ID(taperDistance,
           outsideDiameterSmallEnd,
           outsideDiameterBigEnd,
           straightLength,
           transitionTaperLength,
           sharkTaperDistance,
           sharkODSmallFit,
           sharkODBigFit,
           wallThickness,
           sharkWallThickness,
           iDExtensionLength,
           cntr = false)
{
    // ID Section Start
    // ID taper section to fit fitting
    translate([ 0, 0, -iDExtensionLength ])
        cylinder(taperDistance + iDExtensionLength + .05,
                 d = outsideDiameterBigEnd- (wallThickness * 2),
                 center = false);
    // Straight section between ends
    translate([ 0, 0, taperDistance ]) cylinder(
        straightLength + .05, d = outsideDiameterBigEnd - (wallThickness * 2), center = false);
    // Taper section to OD for fit ID
    translate([ 0, 0, taperDistance + straightLength ])
        cylinder(transitionTaperLength,
                 d1 = outsideDiameterBigEnd- (wallThickness * 2),
                 d2 = sharkODBigFit - (sharkWallThickness * 2),
                 center = false);
    // Straight to oal
    translate([ 0, 0, Taper_Distance + straightLength + transitionTaperLength- .1 ])
        cylinder(sharkTaperDistance+ iDExtensionLength,
                 d = sharkODBigFit - (sharkWallThickness * 2),
                 center = false);
};

























