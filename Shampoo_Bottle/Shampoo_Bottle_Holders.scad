// All units are in Milimeter
$fn = 256;
bottleOD = 63.5; 
lidOD = 26.924;
lidLength = 27.94;
oal = 88.9; //71.12 Default
wallThickness = 5;
fit = .889; //.635
difference(){
    cylinder(oal,d=bottleOD+wallThickness,center=false);
    translate([0,0,-4])cylinder(oal+10,d=lidOD+fit,center=false);
    translate([0,0,bottleOD/2+lidLength+5])sphere(bottleOD/2+fit);
    translate([0,0,bottleOD])cylinder(oal+5,d=bottleOD+fit,center=false);

};



