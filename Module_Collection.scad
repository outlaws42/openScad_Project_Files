$fn=64;

// Examples
//cuberad(20,20,20,2,type="all");
//roundedcube(20,20,5,1.5);
//!rounded_cube([60,80,70],3);


module cuberad(xsize=10,ysize=10,zsize=10,diameter=2, type="all"){
    // Example cuberad
    // cuberad(width,length,height,diameter of radius)
    if (type=="all"){
    minkowski() {
        cube([xsize-diameter/2,ysize-diameter/2,zsize-diameter/2],center=true);
        sphere(d=diameter);
        }
        
    }
    else if (type=="corner"){
    minkowski() {
        cube([xsize-diameter,ysize-diameter,zsize] ,center=true);
        cylinder(d=diameter);
        }
        
    }
}


module roundcube(xdim,ydim,zdim,rdim){
     // Example roundedcube
    // roundedcube(x position,y position,z height, radius of radius)
    
    hull(){
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim);
        translate([xdim-rdim,rdim,0]) cylinder(r=rdim, h=zdim);
    
        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim);
    }
}


module roundedcube(xx, yy, height, radius) {

difference(){

    cube([xx,yy,height]);

    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
    translate([xx,0,0])
    rotate(90)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([xx,yy,0])
    rotate(180)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([0,yy,0])
    rotate(270)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
}
}

module move(x=0,y=0,z=0,rx=0,ry=0,rz=0) { translate([x,y,z])rotate([rx,ry,rz]) children(); }

module rounded_cube(dimensions, rad) {
  
  
  x=dimensions[0];
  y=dimensions[1];
  z=dimensions[2];

  hull() {
    #move(ry=90,y=y/2-rad,z=z/2-rad) pill(rad=rad,h=x);
    #move(ry=90,y=-(y/2-rad),z=z/2-rad) pill(rad=rad,h=x);
    #move(ry=90,y=y/2-rad,z=-(z/2-rad)) pill(rad=rad,h=x);
    #move(ry=90,y=-(y/2-rad),z=-(z/2-rad)) pill(rad=rad,h=x);
  }
    
}

module pill(rad,h) {
  end_center_l = h - (rad*2);
  cylinder(r=rad,h= end_center_l ,center=true);
  move(z=end_center_l/2) sphere(r=rad,center=true);
  move(z=-end_center_l/2) sphere(r=rad,center=true);
}


