/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Bottle Box Container] */
Length = 131.572;           // 5.180"
Width = 78.994;             // 3.110"
Height = 50.8;              // 2.0"
Wall_Thickness = 2.54;      // .100"
Floor_Thickness = 6.3;      //.25"
Screw_Hole_Diameter = 5.08; // .20"
Chamfer_Adjust = 3.5;       // .138"
Amount_Of_Screw_Holes = 2;

difference()
{   
    // Outside Dimensions
    cube([ 
        Length + (Wall_Thickness * 2), 
        Width + (Wall_Thickness * 2), 
        Height ],
         center = false);
    // Inside Dimensions
    translate([ 
        Wall_Thickness, 
        Wall_Thickness, 
        Floor_Thickness])
        cube([ Length, Width, Height], center = false);
    // Screw Hole
    for (x = [1:Amount_Of_Screw_Holes])
        screwHoleBox(x,
                     Width,
                     Length,
                     Screw_Hole_Diameter,
                     Wall_Thickness,
                     Floor_Thickness,
                     Amount_Of_Screw_Holes);
    // Chamfer
    for(x=[1:Amount_Of_Screw_Holes])
     chamferHoleBox(
       x,
       Width,
       Length,
       Screw_Hole_Diameter,
       Wall_Thickness,
       Floor_Thickness,
       Amount_Of_Screw_Holes,
       Chamfer_Adjust);
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
        (wallThickness) + (screwHoleDiameter / 2) +
           round(xPos*(length / (screwHoleAmount+1))),
        (wallThickness) + (screwHoleDiameter / 2) + (width / 2),
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
        (wallThickness) + (screwHoleDiameter / 2) + 
        round(xPos * (length / (screwHoleAmount+1))),
        (wallThickness) + (screwHoleDiameter / 2) + (width / 2),
        floorThickness -
        chamferAdjust
    ]) cylinder(
        h = screwHoleDiameter, 
        d1 = screwHoleDiameter, 
        d2 = screwHoleDiameter*2, 
        center = false
        );
}













