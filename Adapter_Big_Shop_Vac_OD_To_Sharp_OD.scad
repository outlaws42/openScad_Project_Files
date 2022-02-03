// All units are in Milimeter
$fn = 256;

//Attachment End 1st Sweeper Settings - (Shop Vac Taper (OD))
OD_Small = 56.769; // 2.235"
OD_Big = 58.42; // 2.300"
Taper_Distance = 46.101; // 1.815
Wall_Thickness = 2.54; // .100
Straight_Lt = 5.7; // .224"
Transition_Taper_Lt = 12.7;

//Sweeper Settings - Shark(OD)
CS_OD_Small = 38.862; // 1.530"
CS_OD_Big = 39.751; // 1.565"
CS_Taper_Distance = 39.751; // 1.565
CS_Wall_Thickness = 2.54; // .100
CS_Straight_Lt = 6.35; // .250"
CS_OD_Big_Fit = .254; // .01"
CS_OD_Small_Fit = .254; // .01"

// DON"T CHANGE (OD plus the fit added)
CS_OD_Big_Plus_Fit = CS_OD_Big+CS_OD_Big_Fit; 
CS_OD_Small_Plus_Fit = CS_OD_Small+CS_OD_Small_Fit; 

// Extra for ID extension
ID_Extension_Lt = 5; 

//OD Profile
difference() { 
 Adapter_OD(
   Taper_Distance,
   OD_Small,
   OD_Big,
   Straight_Lt,
   Transition_Taper_Lt,
   CS_Taper_Distance,
   CS_OD_Small_Plus_Fit,
   CS_OD_Big_Plus_Fit,
   CS_Straight_Lt,
   false
  );
  // Inside Profile
  Adapter_ID(
   Taper_Distance,
   OD_Small,
   OD_Big,
   Straight_Lt,
   Transition_Taper_Lt,
   CS_Taper_Distance,
   CS_OD_Small_Plus_Fit,
   CS_OD_Big_Plus_Fit,
    false
  );
};

module Adapter_OD(
  Fit_Taper,
  Small_OD,
  Big_OD,
  Strght_Lt,
  Taper_Lt,
  Taper_Distance_CS,
  Small_OD_CS,
  Big_OD_CS,
  Strght_Lt_CS,
  cntr=false
){
  // OD taper section to fit attachment
  cylinder(
   Fit_Taper,
   d1=Small_OD,
   d2=Big_OD,
   center=cntr
  );
  // Straight section at OD
  translate([0,0,Fit_Taper])
  cylinder(
   Strght_Lt,
   d=Big_OD,
   center=cntr
  );
  // Taper section to OD for fit CS
  translate([0,0,Fit_Taper+Strght_Lt])
  cylinder(
   Taper_Lt,
   d1=Big_OD,
   d2=Big_OD_CS,
   center=cntr
  );
  // Straight section at OD
  translate([0,0,Fit_Taper+Strght_Lt+Taper_Lt])
  cylinder(
   Strght_Lt_CS,
   d=Big_OD_CS,
   center=cntr
  );
  // OD taper section to fit Sweeper
  translate([0,0,Fit_Taper+Strght_Lt+Taper_Lt+Strght_Lt_CS])
  cylinder(
   Taper_Distance_CS-Strght_Lt_CS,
   d1=Big_OD_CS,
   d2=Small_OD_CS,
   center=cntr
  );

};

module Adapter_ID(
  Taper_Distance,
  Small_OD,
  Big_OD,
  Straight_Lt,
  Transition_Taper_Lt,
  Taper_Distance_CS,
  Small_OD_CS,
  Big_OD_CS,
  cntr=false
){
  // ID Section Start
  // ID taper section to fit fitting
  translate([0,0,-ID_Extension_Lt])
  cylinder(
   Taper_Distance+ID_Extension_Lt+.05,
   d=Big_OD-(Wall_Thickness*2),
   center=false
  );
  // Straight section between ends
  translate([0,0,Taper_Distance])
  cylinder(
   Straight_Lt+.05,
   d=Big_OD-(Wall_Thickness*2),
   center=false
  );
  // Taper section to OD for fit ID
  translate([0,0,Taper_Distance+Straight_Lt])
  cylinder(
   Transition_Taper_Lt,
   d1=Big_OD-(Wall_Thickness*2),
   d2=Big_OD_CS-(CS_Wall_Thickness*2),
   center=false
  );
  // Straight to oal
  translate([0,0,Taper_Distance+Straight_Lt+Transition_Taper_Lt-.1])
  cylinder(
   Taper_Distance_CS+ID_Extension_Lt,
   d=Big_OD_CS-(CS_Wall_Thickness*2),
   center=false
  );

};