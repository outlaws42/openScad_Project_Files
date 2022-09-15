// All units are in Milimeter
$fn = 256;
mm=25.4;

OD = 2.795*mm; // ID of the OpenBuilds Plate
ID = 2.550*mm; // OD of the Performax Router
OD_height = 1.0*mm; // Height of the adapter OD
ID_height = ((OD_height+.5)*mm); // Height of the adapter ID
O_fit=.0196*mm; // fit amount OpenBuilds Plate
P_fit=.0196*mm; // fit amount Performax Router





  // OD taper section to fit attachment
difference() {
  cylinder(
   OD_height,
   d=OD-O_fit,
   center=false
  );
  // Straight section at OD
  translate([0,0,-.5])
  cylinder(
   ID_height,
   d=ID+P_fit,
   center=false
  );
}