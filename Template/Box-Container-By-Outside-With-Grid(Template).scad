/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */

Length = 55;
Width = 55;
Fit = 0; //.889(.035") is a good fit for most 
Height = 50.8;
Wall_Thickness = 2.54;
Floor_Thickness = 6.3;

/* [Screw Hole Properties] */
Screw_Holes_On = true;
Screw_Hole_Diameter = 5.08;
Amount_Of_Screw_Holes = 2;
Chamfer_Adjust = 3.5;

Outside_Box();

module Outside_Box(){
  difference()
{   
    // Outside Dimensions
    cube([ 
        Length, 
        Width, 
        Height ],
         center = false);
    // Inside Dimensions
    translate([ 
        Wall_Thickness, 
        Wall_Thickness, 
        Floor_Thickness])
        cube([ 
          Length-Wall_Thickness*2, 
          Width-Wall_Thickness*2, 
          Height], 
          center = false);
    
};
}















