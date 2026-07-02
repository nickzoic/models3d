include <../saturnalia/gears.scad>;

id = 39;

gp = 1;
gt = 50;

module clamp(id, hh) {
difference() {
    union() {
        cylinder(h=hh,d=gp*gt*.88);
        spur_gear(gp, gt, hh, hh);
        translate([-14,10,0]) cube([28,15,hh]);
        translate([0,25,hh/2]) rotate([0,90,0]) cylinder(d=hh,h=28, center=true);
    }
    translate([0,0,-1]) cylinder(d=id,h=hh+2);
    cylinder(d1=id+2,d2=id,h=1);
    translate([0,0,hh-1]) cylinder(d1=id,d2=id+2,h=1);
    translate([-1,15,-1]) cube([2,52,hh+2]);
    translate([0,25,hh/2]) rotate([0,90,0]) cylinder(d=5,h=20);
    translate([0,25,hh/2]) rotate([0,-90,0]) cylinder(d=3,h=20);
    translate([-8,22,hh-1]) linear_extrude(1) rotate([0,0,180]) text("2",size=5,halign="center",valign="center");
}   
}

//translate([56,0,0]) rotate([0,0,360/28/2]) spur_gear(2,28,1,1);
clamp(39,8);