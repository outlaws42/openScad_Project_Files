/* [Model Resolution (All Measurments are in metric)] */
$fn = 256;

wall_thickness = 1.588;

/* [Outer Dimensions] */
start_x = 28.575;
start_y = 0.00;
top_left_x = 0.00;
top_left_y = 133.35;
top_right_x = 190.5;
top_right_y = 133.35;
slope_bottom_x = 60.00;
slope_bottom_y = 5.0;
bottom_right_x = 161.925;
bottom_right_y = 0.00;

difference(){
linear_extrude(241.3){
    polygon(points=[
[start_x,start_y],
[top_left_x,top_left_y],
[top_right_x,top_right_y],
//[slope_bottom_x,slope_bottom_y],
[bottom_right_x,bottom_right_y],
]
    );
}

translate([0,0,wall_thickness])
linear_extrude(261.3){
    polygon(points=[
[start_x+wall_thickness,start_y+wall_thickness],
[top_left_x+wall_thickness,top_left_y-wall_thickness],
[top_right_x-wall_thickness,top_right_y-wall_thickness],
//[slope_bottom_x,slope_bottom_y],
[bottom_right_x-wall_thickness,bottom_right_y+wall_thickness],
]
    );
}
}
