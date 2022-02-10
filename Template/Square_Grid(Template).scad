/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Size = 50;
Height = 3;
Wall_Thickness = 1.25;
Floor_Thickness = 1.25;

/* [Window Properties] */
Window_Size_Difference = 7;

/* [Hidden] */
Id_Adjustment =1;

Grid(3,3,Size)
Outside_Box_With_Window(
  Size,
  Size,
  Height,
  Wall_Thickness,
  Floor_Thickness,
  Id_Adjustment
  );

module Outside_Box_With_Window(
  length,
  width,
  height,
  wallThickness,
  floorThickness,
  idAdjustment = 1
  ){
  difference()
{   
    // Outside Dimensions
    cube([ 
        length, 
        width, 
        height ],
         center = false);
    // Inside Dimensions
    translate([ 
        wallThickness, 
        wallThickness, 
        floorThickness])
        cube([ 
          length-wallThickness*2, 
          width-wallThickness*2, 
          height], 
          center = false);
    
    // Internal Window
    translate([ 
        wallThickness+((length-length)+(Window_Size_Difference/2)), 
        wallThickness+((width-width)+(Window_Size_Difference/2)), 
        -idAdjustment])
        cube([ 
          length-((wallThickness*2)+Window_Size_Difference), 
          width-((wallThickness*2)+Window_Size_Difference), 
          height+idAdjustment], 
          center = false);
    
};
}
//Grid(10,26,9)
//cube(h=)
//cylinder(r=2,h=5,center=false);

module Grid(x_axis,y_axis,space){
  for (x=[1:space:x_axis*space]){
    for(y=[1:space:y_axis*space]){
      translate([x,y,0]){
      children();
    }
    }

  }
}