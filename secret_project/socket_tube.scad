socket_width = 18;
socket_depth = 30;
thread_diameter = 13;
shoulder_diameter = 15;

tube_height = 40;
tube_diameter = 42;

screw_diameter  = 4;
screw_head_diameter = 9;

$fn=64;

difference() {
    cylinder(d=tube_diameter, h=tube_height,center=true);
    cylinder(d=thread_diameter,h=tube_height+2,center=true);
    translate([0,0,2]) cylinder(d=shoulder_diameter,h=tube_height,center=true);
    translate([0,0,3]) cube([socket_width,socket_width,tube_height],center=true);
    for (a = [0,90,180,270]) {
        rotate([0,0,a]) translate([(tube_diameter+socket_width)/4,0,-tube_height/2]) {
            cylinder(d1=screw_head_diameter,d2=screw_diameter,h=(screw_head_diameter-screw_diameter)/2);
            cylinder(d=screw_diameter, h=tube_height+2);
        }
        
    }
}