// OD Fitting module. A hose or another fitting goes over
// this fitting.
module OD_Fitting(
  fittingTaperDistance = 39,
  fittingODBig = 102.387,
  fittingODSmall = 101,
  fittingWallThickness = 5.08,
  fittingStraightLength = 6.35,
  idExtensionLength = 2,
  cntr = false
){
  
  difference(){
    // OD Straight Section
    translate([ 0, 0,0])
        cylinder(
          h=fittingStraightLength, 
          d = fittingODBig, 
          center = cntr);
    // ID Straight Section    
    translate([ 0, 0,-idExtensionLength])
        cylinder(
          h=fittingStraightLength+ idExtensionLength+1, 
          d = fittingODBig-(fittingWallThickness*2), 
          center = cntr);
  }
  difference(){
    // OD taper section
    translate(
        [ 0, 0, fittingStraightLength ])
        cylinder(h=fittingTaperDistance,
                 d1 = fittingODBig,
                 d2 = fittingODSmall,
                 center = cntr);
    // ID taper section
    translate([ 0, 0, fittingStraightLength-idExtensionLength])
        cylinder(
            h=fittingTaperDistance + idExtensionLength+1,
            d1 = fittingODBig - (fittingWallThickness * 2),
            d2 = fittingODSmall- (fittingWallThickness * 2),
            center = false);

  }

    
};

// Base definition with ID through the base.
module
Base(
    baseWidth = 50,
    baseThickness = 6.35,
    baseLength = 50,
    fittingWallThickness = 2.54,
    fittingODBig = 101.6,
    useID = true,
    cntr = true

)
{
    difference()
    {
        translate([ 0, 0, baseThickness / 2 ])
            cube([ baseWidth, baseLength, baseThickness ], center = cntr);
        // translate([ 0, 0, 0 ])
        //     cylinder(
        //              h=baseThickness,
        //              d1 = baseLength,
        //              d2 = baseLength,
        //              center = false);
        if(useID == true)
        translate([ 0, 0,-2 ])
            cylinder(
                     h=baseThickness*2,
                     d1 = fittingODBig - (fittingWallThickness*2),
                     d2 = fittingODBig - (fittingWallThickness*2),
                     center = false);
    };
    
};

// Sphere  definition
module
Half_Sphere(
    radius = 76, 
    wallThickness = 5.08
    )
{
     difference()
    {
        sphere(radius);
        translate([ 0, 0, -5.5 ]) 
        sphere(radius - wallThickness);
        translate([ 0, 0, -radius ]) 
        cube(size = radius * 2, center = true);
        
    };
};

// Screw holes definition in a square pattern
module
Screw_Holes_Square_Pattern(yAxis, thickness, xAxis, screwHoleDiameter)
{
    for (i = [-xAxis/ 2 + screwHoleDiameter:65:xAxis/ 2 - screwHoleDiameter])
        translate([ -yAxis/ 2 + screwHoleDiameter, i, -thickness/ 2 ])
            cylinder(thickness* 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-yAxis/ 2 + screwHoleDiameter:65:yAxis/ 2 - screwHoleDiameter])
        translate([ i, -xAxis/ 2 + screwHoleDiameter, -thickness/ 2 ])
            cylinder(thickness* 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-xAxis/ 2 + screwHoleDiameter:65:xAxis/ 2 - screwHoleDiameter])
        translate([ yAxis/ 2 - screwHoleDiameter, i, -thickness/ 2 ])
            cylinder(thickness* 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);

    for (i = [-yAxis/ 2 + screwHoleDiameter:60:yAxis/ 2 - screwHoleDiameter])
        translate([ i, xAxis/ 2 - screwHoleDiameter, -thickness/ 2 ])
            cylinder(thickness* 2,
                     d1 = screwHoleDiameter,
                     d2 = screwHoleDiameter,
                     center = false);
};