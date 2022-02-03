$fn = 200;
socket_hole_dia = 16;
base_thickness = 4.35;
base_width = 25;
base_length = 25;
corner_rad=2;
mount_hole_dia = 3;
mount_plate_length = 15;

// Base
difference() {
    //roundedcube(25,25,4.35,3,center=true);
    minkowski(){
        cube([base_width-corner_rad,base_length-corner_rad,base_thickness-3.25], center=true);
        cylinder(h=base_thickness-2.5,d=corner_rad);
    }
    cylinder(h=base_thickness+.5,d=socket_hole_dia,center=true);
     translate([0,0,base_thickness]) rotate([0,90,0]) cylinder(h=base_width+.5,d=6.93,center=true);
}


// Mount Plate
translate([0,base_length/2-base_thickness/2,base_thickness/2+mount_plate_length/2-1.5]){
    difference() { 
      minkowski() {  
        cube([base_width-corner_rad,   base_thickness-corner_rad,mount_plate_length-corner_rad], center=true);
        cylinder(h=base_thickness-2.5,d=corner_rad);
      }
    translate([0,5,mount_plate_length/2-mount_hole_dia]) rotate([90,0,0]) cylinder(h=10,d=mount_hole_dia);
        
     translate([0,base_thickness-5.35,mount_plate_length/2-mount_hole_dia]) rotate([90,0,0]) cylinder(d1=mount_hole_dia-1,d2=mount_hole_dia*2-1,h=2);
        
     translate([0,2.5,-mount_plate_length/2+mount_hole_dia+1.5]) rotate([90,0,0]) cylinder(h=10,d=mount_hole_dia);
    
     translate([0,base_thickness-5.35,-mount_plate_length/2+  mount_hole_dia+1.5]) rotate([90,0,0]) cylinder(d1=mount_hole_dia-1,d2=mount_hole_dia*2-1,h=2);
 }
}

module roundedcube(xdim ,ydim ,zdim,rdim,center){
hull(){
translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
}
}
