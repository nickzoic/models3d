$fn=100;

difference() {
    union () {
        cube([38,44,6], center=true);
        translate([0,0,10]) cube([38,12,15], center=true);
        translate([0,0,17]) rotate([90,0,0]) cylinder(d=38,h=12, center=true);
        translate([-17,18,6]) cuberotate([0,90,0]) cylinder(d=12,h=4,center=true);
        translate([17,18,6]) rotate([0,90,0]) cylinder(d=12,h=4,center=true);
    }
    translate([-15,9,0]) cylinder(h=100,d=3.25, center=true);
    translate([15,9,0]) cylinder(h=100,d=3.25, center=true);
    translate([0,0,21]) rotate([90,0,0]) cylinder(d=16,h=100, center=true);
    translate([0,2,21]) rotate([90,0,0]) cylinder(d1=18,d2=0,h=9, center=true);
    translate([0,-2,21]) rotate([-90,0,0]) cylinder(d1=18,d2=0,h=9, center=true);
    
    translate([0,0,17]) rotate([0,90,0]) cylinder(d=4,h=100, center=true);
    cylinder(d=4,h=100, center=true);
    translate([8,-14,0]) cylinder(d=12,h=100, center=true);
    translate([-8,-14,0]) cylinder(d=12,h=100, center=true);
    translate([0,+14,0]) cylinder(d=12,h=100, center=true);
    translate([0,18,6]) rotate([0,90,0]) cylinder(d=6,h=100,center=true);
}