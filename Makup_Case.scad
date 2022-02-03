// All units are in Milimeter
$fn = 256;

// Main Box (Dimensions Outside)
boxLength = 349.25; // 13.75"
boxWidth = 254; // 10"
boxHeight = 152.4; // 6"

//Blow Dryer Cylinder
dryerCylDia = 62.738;
dryerCylHt = 86.36;

//Cream Cylinder (Inside Dia)
creamCylDia = 58.674; // 2.310"
creamCylHt = 6.35; // 2.155" bottle, container .25"
creamfit = .889; // .035"
creamThickness = 2.54; // .100"
creamRimWt = 6.35; // .25"
creamRimHt = 2.54; // .100"

//Comb/Pick Cylinder (Inside Dia)
combCylDia = 54.102; // 2.130"
combCylHt = 63.5; // 2.5"
combfit = .889; // .035"
combThickness = 2.54; // .100"

//Brushes Cylinder (Inside Dia)
brushCylDia = 76.2; // 3"
brushCylHt = 86.36; // 3.4"
brushfit = .889; // .035"
brushThickness = 2.54; // .100"

//Toothbrush Cylinder (Inside Dia)
toothCylDia = 38.1; // 1.5"
toothCylHt = 86.36; // 3.4"
toothfit = .889; // .035"
toothThickness = 2.54; // .100"

//Makeup bag container
bagLt = 203.2; // 8"
bagWt = 101.6; // 4"
bagHt = 127; // 5"
bagThickness = 2.54; // .100"

//bottle box 4 container
bb4Lt = 131.572; // 5.180"
bb4Wt = 78.994; // 3.110"
bb4Ht = 50.8; // 2.0"
bb4Thickness = 2.54; // .100"

//bottle box 5 container
bb5Lt = 154.94; // 6.1"
bb5Wt = 40.64; // 1.6"
bb5Ht = 50.8; // 2.0"
bb5Thickness = 2.54; // .100"

//Q-tip container
qtLt = 73.025; // 2.875"
qtWt = 19.05; // .75"
qtHt = 25.4; // Box 2.875", Container Depth 1.0" 
qtfit = .889; // .035"
qtThickness = 2.54; // .100"
qtRimWt = 6.35; // .25"
qtRimHt = 2.54; // .100"

//Floss container
flossLt = 48.006; // 1.89"
flossWt = 14.732; // .580"
flossHt = 25.4; // Box 2.300", Container Depth 1.0"
flossfit = .889; // .035"
flossThickness = 2.54; // .100"
flossRimWt = 6.35; // .25"
flossRimHt = 2.54; // .100"

// Wall thickness of the insert containers 
contThickness = 2.54;

// Wall thickness of the main container
mainThickness = 19.05;

//fit = .889; //.635

// Main Box
%difference(){
    cube([
        boxLength,
        boxWidth,
        boxHeight
        ],
        center=true
    );
    translate([0,0,mainThickness])
    cube([
        boxLength-mainThickness*2,
        boxWidth-mainThickness*2,
        boxHeight
        ],
        center=true
    );
  

};


//Makeup bag container 
translate([-((bagWt+bagThickness*2)/2),-((bagWt+bagThickness*2)/2),0]){
    difference(){
        cube([bagLt+bagThickness*2,bagWt+bagThickness*2,bagHt],    center=true);
        translate([0,0,bagThickness])cube([bagLt,bagWt,bagHt],     center=true);
  

    };
};

//Bottle box 4 container 
rotate(90) translate([-((bb4Wt+bb4Thickness*2)/2),-((bb4Wt+bb4Thickness*2)+30),-40]){
    difference(){
        cube([bb4Lt+bb4Thickness*2,bb4Wt+bb4Thickness*2,bb4Ht],    center=true);
        translate([0,0,bb4Thickness])cube([bb4Lt,bb4Wt,bb4Ht],     center=true);
  

    };
};

//Bottle box 5 container 
translate([((((boxLength/2)-mainThickness)-(bb5Lt+bb5Thickness*2)/2)),(((boxWidth/2)-mainThickness)-(bb5Wt+bb5Thickness*2)/2),-40]){
    difference(){
        cube([bb5Lt+bb5Thickness*2,bb5Wt+bb5Thickness*2,bb5Ht],    center=true);
        translate([0,0,bb5Thickness])cube([bb5Lt,bb5Wt,bb5Ht],     center=true);
  

    };
};


// Q-Tip container 
translate([115,39,-27]){
    difference(){
        cube([qtLt+qtThickness*2+qtfit,qtWt+qtThickness*2+qtfit,qtHt],center=true);
        translate([0,0,qtThickness])cube([qtLt+qtfit,qtWt+qtfit,qtHt],center=true);
  

    };
};

// Floss container 
translate([61.8,-1,-27]){
    rotate(90) difference(){
        cube([flossLt+flossThickness*2+flossfit,flossWt+flossThickness*2+flossfit,flossHt],center=true);
        translate([0,0,flossThickness])cube([flossLt+flossfit,flossWt+flossfit,flossHt],center=true);
  

    };
};


// Hair Dryer Container
 translate([-(((boxLength/2)-mainThickness)-(dryerCylDia/2)),((boxWidth/2)-mainThickness)-(dryerCylDia/2),-20])cylinder(dryerCylHt,d=dryerCylDia,center=true);

// comb/Pick Container
 translate([20,30,-20])cylinder(combCylHt,d=combCylDia+combfit+combThickness,center=true);

// Brush Container
 translate([-50,((boxWidth/2)-mainThickness)-((brushCylDia+brushThickness)/2),-20])cylinder(brushCylHt,d=brushCylDia+brushThickness,center=true);


