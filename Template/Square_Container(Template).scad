// This model uses the "Chamfers-for-OpenSCAD" library
// You can get it here https://freesoft.dev/program/50741079    
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Size = 50;
Height = 45;
Wall_Thickness = 1.27;
Floor_Thickness = 1.27;

/* [Grid Properties] */
Grid_Height = 3;
Amount_Along_X_Axis = 2;
Amount_Along_Y_Axis = 2;

/* [Name Tag Properties] */
Name_Tag_On = true;
// Size in the Y-Axis
Length = 40;
//Size in the Axis
Width = 12.7;
//Height of the name tag
Name_Tag_Height = 12; 
Chamfer_Amount = 11.5;

/* [Hidden] */
Id_Adjustment =1;

Box(
  Size,
  Size,
  Height-Grid_Height,
  Wall_Thickness,
  Floor_Thickness,
  Amount_Along_X_Axis,
  Amount_Along_Y_Axis,
  gridHeight = Grid_Height
);

Name_Tag(
      Width,
      Length,
      Name_Tag_Height,
      boxY = Size,
      boxHeight= Height,
      amountAlongYAxis= Amount_Along_Y_Axis
    );

Grid(Amount_Along_X_Axis,Amount_Along_Y_Axis,Size)
Base_Enterface(
  Size,
  Size,
  Grid_Height,
  Wall_Thickness,
  Floor_Thickness
  );
module Base_Enterface(
 length,
 width,
 height,
 wallThickness,
 floorThickness
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
   amountAlongYAxis,
   gridHeight
 ){
   sizeX = length*amountAlongXAxis;
   sizeY = width*amountAlongYAxis;
  //  tabX = 12.7;
  //  tabY = 40;
  //  tabYInternal = 20;
  //  tabHeight = 12;
   
   // Outside Dimensions
    translate([0,0,gridHeight])
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

module Name_Tag(
  tagX,
  tagY,
  tagHeight,
  chamferAmount=11.5,
  boxWallThickness=1.27,
  boxY=50,
  boxHeight=50,
  amountAlongYAxis=1,
  ){
    sizeY=boxY*amountAlongYAxis;
  translate([
       boxWallThickness ,
       ((sizeY-(boxWallThickness)/2)/2)-(tagY/2) ,
       boxHeight-tagHeight
       ])
    chamferCube([
      tagX,
      tagY,
      tagHeight],
      [[0,0,0,0],[0,0,0,1],[0,0,0,0]],
      chamferAmount);
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