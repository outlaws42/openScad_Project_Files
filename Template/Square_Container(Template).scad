// This model uses the "Chamfers-for-OpenSCAD" library
// You can get it here https://freesoft.dev/program/50741079    
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Box Container Properties] */
Size = 55;
Height = 12;
Wall_Thickness = 1.27;
Floor_Thickness = 1.27;

/* [Grid Properties] */
Grid_Height = 6.35;
Amount_Along_X_Axis = 1;
Amount_Along_Y_Axis = 2;

/* [Name Tag Properties] */
Name_Tag_On = false;
// Size in the Y-Axis
Length = 40;
//Size in the Axis
Width = 13.7;


/* [Hidden] */
Id_Adjustment =1;

Box_Outside(
  length = Size,
  width = Size,
  height = Height-Grid_Height,
  wallThickness = Wall_Thickness,
  floorThickness = Floor_Thickness,
  amountAlongXAxis = Amount_Along_X_Axis,
  amountAlongYAxis = Amount_Along_Y_Axis,
  gridHeight = Grid_Height
);

if (Name_Tag_On==true)
Name_Tag(
      tagX = Width,
      tagY = Length,
      boxY = Size,
      boxWallThickness = Wall_Thickness,
      boxHeight= Height,
      amountAlongYAxis= Amount_Along_Y_Axis
    );

Grid(
  xAmount = Amount_Along_X_Axis,
  yAmount = Amount_Along_Y_Axis,
  space = Size)
Base_Enterface(
  length = Size,
  width = Size,
  height = Grid_Height,
  floorThickness = Floor_Thickness
  );
module Base_Enterface(
 length = 50,
 width = 50,
 height = 50,
 floorThickness = 4.0
){
  // Chamfer
  //  translate([-chamferCubeSizeAdj ,-chamferCubeSizeAdjust ,0])

    chamferCube([
      length,
      width,
      height],
      [[1,1,0,0],[1,0,0,1],[0,0,0,0]],
      height);  
    
}
 module Box_Outside(
   length = 50,
   width = 50,
   height = 45,
   wallThickness = 1.27,
   floorThickness = 1.27,
   amountAlongXAxis = 1,
   amountAlongYAxis = 1,
   gridHeight = 3
 ){
   sizeX = length*amountAlongXAxis;
   sizeY = width*amountAlongYAxis;
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
  tagX = 12.7,
  tagY = 40,
  boxWallThickness=0,
  boxY=0,
  boxHeight=0,
  amountAlongYAxis=1,
  ){
    sizeY=boxY*amountAlongYAxis;
  translate([
       boxWallThickness ,
       ((sizeY-(boxWallThickness)/2)/2)-(tagY/2) ,
       boxHeight-tagX
       ])
    chamferCube([
      tagX,
      tagY,
      tagX],
      [[0,0,0,0],[0,0,0,1],[0,0,0,0]],
      tagX-.3);
}

module Grid(
  xAmount = 1,
  yAmount = 1,
  space = 1){
  for (x=[0:space:(xAmount-1)*space]){
    for(y=[0:space:(yAmount-1)*space]){
      translate([x,y,0]){
      children();
    }
    }

  }
}