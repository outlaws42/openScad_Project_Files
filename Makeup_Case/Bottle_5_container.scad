/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */

Length = 154.94;
Width = 40.64;
Fit = 0;
Height = 50.8;
Wall_Thickness = 2.54;
Floor_Thickness = 6.3;

/* [Screw Hole Properties] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 5.08;
Amount_Of_Screw_Holes = 2;
Chamfer_Adjust = 3.5;


difference()
{   
    // Outside Dimensions
    cube([ 
        Length+Fit+(Wall_Thickness * 2), 
        Width+Fit+(Wall_Thickness * 2), 
        Height ],
         center = false);
    // Inside Dimensions
    translate([ 
        Wall_Thickness, 
        Wall_Thickness, 
        Floor_Thickness])
        cube([ Length+Fit, Width+Fit, Height], center = false);
    if(Screw_Holes_On==true){
        // Screw Hole
        for (x = [1:Amount_Of_Screw_Holes])
            screwHoleBox(x,
                        Width+Fit,
                        Length+Fit,
                        Screw_Hole_Diameter,
                        Wall_Thickness,
                        Floor_Thickness,
                        Amount_Of_Screw_Holes);
        // Chamfer
        for(x=[1:Amount_Of_Screw_Holes])
        chamferHoleBox(
        x,
        Width+Fit,
        Length+Fit,
        Screw_Hole_Diameter,
        Wall_Thickness,
        Floor_Thickness,
        Amount_Of_Screw_Holes,
        Chamfer_Adjust);
    }
    
};

// Screw Hole
module
screwHoleBox(xPos,
             width,
             length,
             screwHoleDiameter,
             wallThickness,
             floorThickness,
             screwHoleAmount)
{
    translate([
        wallThickness +
           round(xPos*(length / (screwHoleAmount+1))),
        wallThickness + (width / 2),
        -floorThickness
    ]) cylinder(
        h = floorThickness+30, 
        d = screwHoleDiameter, 
        center = false);
}

module
chamferHoleBox(xPos,
               width,
               length,
               screwHoleDiameter,
               wallThickness,
               floorThickness,
               screwHoleAmount,
               chamferAdjust)
{
    translate([
        wallThickness + 
        round(xPos * (length / (screwHoleAmount+1))),
        wallThickness + (width / 2),
        floorThickness -
        chamferAdjust
    ]) cylinder(
        h = screwHoleDiameter, 
        d1 = screwHoleDiameter, 
        d2 = screwHoleDiameter*2, 
        center = false
        );
}













