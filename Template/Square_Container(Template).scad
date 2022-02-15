// This model uses the "Chamfers-for-OpenSCAD" library
// You can get it here https://freesoft.dev/program/50741079    
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Size = 50;
Height = 3;
Wall_Thickness = 2.54;
Floor_Thickness = 1.25;

/* [Grid Properties] */
Amount_Along_X_Axis = 2;
Amount_Along_Y_Axis = 2;

/* [Window Properties] */
Window_Size_Difference = 7;

/* [Hidden] */
Id_Adjustment =1;

Box(
  Size,
  Size,
  50,
  Wall_Thickness,
  Floor_Thickness,
  Amount_Along_X_Axis,
  Amount_Along_Y_Axis
);

// Grid(Amount_Along_X_Axis,Amount_Along_Y_Axis,Size)
// Outside_Box_With_Window(
//   Size,
//   Size,
//   Height,
//   Wall_Thickness,
//   Floor_Thickness,
//   Id_Adjustment
//   );

// translate([0,0,Floor_Thickness])
//  chamferCube([Size,Size,2],[[1,1,0,0],[1,0,0,1],[0,0,0,0]],1.5);

Grid(Amount_Along_X_Axis,Amount_Along_Y_Axis,Size)
Base_Enterface(Size,Size,2);
module Base_Enterface(
 length,
 width,
 height
){
  // Chamfer
  //  translate([-chamferCubeSizeAdj ,-chamferCubeSizeAdjust ,0])
    chamferCube([
      length,
      width,
      height],
      [[1,1,0,0],[1,0,0,1],[0,0,0,0]],
      1.5);
}
 module Box(
   length,
   width,
   height,
   wallThickness,
   floorThickness,
   amountAlongXAxis,
   amountAlongYAxis
 ){
  //  gridSize = amountAlongXAxis*amountAlongYAxis
   sizeX = length*amountAlongXAxis;
   sizeY = width*amountAlongYAxis;
   tabX = 12;
   tabY = 25;
   tabHeight = 12;

    translate([wallThickness ,((sizeY-(wallThickness)/2)/2)-(tabY/2) ,height+2-tabHeight])
    chamferCube([
      tabX,
      tabY,
      tabHeight],
      [[0,0,0,0],[0,0,0,1],[0,0,0,0]],
      11);
  
   // Outside Dimensions
    translate([0,0,2])
    difference(){
      cube([ 
        sizeX, 
        sizeY, 
        height ],
         center = false);
    // Inside Dimensions
    translate([ 
        wallThickness, 
        wallThickness, 
        floorThickness])
        cube([ 
          sizeX-wallThickness*2, 
          sizeY-wallThickness*2, 
          height], 
          center = false);
    }
    
 }

module Outside_Box_With_Window(
  length,
  width,
  height,
  wallThickness,
  floorThickness,
  idAdjustment = 1
  ){
    chamferCubeSizeAdjust = .24;
  difference()
{   
    // Outside Dimensions
    cube([ 
        length, 
        width, 
        height ],
         center = false);
    // Chamfer
    translate([-chamferCubeSizeAdjust ,-chamferCubeSizeAdjust ,floorThickness])
    chamferCube([
      length+(chamferCubeSizeAdjust *2),
      width+(chamferCubeSizeAdjust *2),
      10],
      [[1,1,0,0],[1,0,0,1],[0,0,0,0]],
      1.5);
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

module Grid(xAmount,yAmount,space){
  for (x=[0:space:(xAmount-1)*space]){
    for(y=[0:space:(yAmount-1)*space]){
      translate([x,y,0]){
      children();
    }
    }

  }
}