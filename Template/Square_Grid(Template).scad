// This model uses the "Chamfers-for-OpenSCAD" library
// You can get it here https://freesoft.dev/program/50741079    
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


/* [Model Resolution (All dimensions are in Millimeters)] */
$fn = 256;

/* [Retention Square Properties] */
Size = 55;
Wall_Height = 6.35;
Floor_Thickness = 1.25;

/* [Grid Properties] */
Amount_Along_X_Axis = 1;
Amount_Along_Y_Axis = 2;

/* [Window Properties] */
Window_Size_Difference = 7;

/* [Hidden] */
Id_Adjustment =1;

Grid(
  xAmount = Amount_Along_X_Axis,
  yAmount = Amount_Along_Y_Axis,
  space = Size)
Square_Containment(
  length = Size,
  width = Size,
  height = Wall_Height,
  wallThickness = Wall_Height,
  // floorThickness = Floor_Thickness,
  idAdjustment = Id_Adjustment
  );

// Box_Outside(
//   length = Size,
//   width = Size,
//   height = 60,
//   gridHeight = Wall_Height
// );
// // translate([0,0,-.005])
// //  chamferCube([Size,Size,10],[[1,1,0,0],[1,0,0,1],[0,0,0,0]],Wall_Height);

// Base_Enterface(
//   height = Wall_Height
// );

module Square_Containment(
  length,
  width,
  height,
  wallThickness,
  // floorThickness,
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
    translate([-chamferCubeSizeAdjust ,-chamferCubeSizeAdjust ,-.015])
    chamferCube([
      length+(chamferCubeSizeAdjust *2),
      width+(chamferCubeSizeAdjust *2),
      10],
      [[1,1,0,0],[1,0,0,1],[0,0,0,0]],
      wallThickness);
    // // Inside Dimensions
    // translate([ 
    //     wallThickness, 
    //     wallThickness, 
    //     floorThickness])
    //     cube([ 
    //       length-wallThickness*2, 
    //       width-wallThickness*2, 
    //       height], 
    //       center = false);
    
    // // Internal Window
    // translate([ 
    //     wallThickness+((length-length)+(Window_Size_Difference/2)), 
    //     wallThickness+((width-width)+(Window_Size_Difference/2)), 
    //     -idAdjustment])
    //     cube([ 
    //       length-((wallThickness*2)+Window_Size_Difference), 
    //       width-((wallThickness*2)+Window_Size_Difference), 
    //       height+idAdjustment], 
    //       center = false);
    
};
}

module Box_Outside(
   length = 50,
   width = 50,
   height = 60,
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

 module Base_Enterface(
 length = 55,
 width = 55,
 height = 50,
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
      wallThickness);
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

module Grid(xAmount,yAmount,space){
  for (x=[0:space:(xAmount-1)*space]){
    for(y=[0:space:(yAmount-1)*space]){
      translate([x,y,0]){
      children();
    }
    }

  }
}