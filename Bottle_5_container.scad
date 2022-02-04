/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Bottle Box Container] */
Length = 154.94;           // 6.1"
Width = 40.64;             // 1.6"
Height = 50.8;              // 2.0"
Wall_Thickness = 2.54;      // .100"
Floor_Thickness = 6.3;      //.5"
Screw_Hole_Diameter = 5.08; // .20"
Chamfer_Adjust = 6.7;       // .137"
Screw_Hole_Amount = 2;

// Bottle box 4 container
difference()
{
    cube([ Length + (Wall_Thickness * 2), Width + (Wall_Thickness * 2), Height ],
         center = false);
    // Inside Dimensions
    translate([ Wall_Thickness, Wall_Thickness, Wall_Thickness ])
        cube([ Length, Width, Height ], center = false);
    // Screw Hole
    for (x = [1:Screw_Hole_Amount])
        screwHoleBox(x,
                     Width,
                     Length,
                     Screw_Hole_Diameter,
                     Wall_Thickness,
                     Floor_Thickness,
                     Screw_Hole_Amount);
    // Chamfer
    for(x=[1:Screw_Hole_Amount])
     chamferHoleBox(
       x,
       Width,
       Length,
       Screw_Hole_Diameter,
       Wall_Thickness,
       Floor_Thickness,
       Screw_Hole_Amount,
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
            xPos*(length / (screwHoleAmount+1)),
        (wallThickness) + (screwHoleDiameter / 2) + (width / 2),
        -floorThickness
    ]) cylinder(150, d = screwHoleDiameter, center = false);
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
        xPos * (length / (screwHoleAmount+1)),
        (wallThickness) + (screwHoleDiameter / 2) + (width / 2),
        floorThickness -
        chamferAdjust
    ]) cylinder(5, d1 = 1, d2 = 10, center = false);
}













