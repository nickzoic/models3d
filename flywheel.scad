$fn=100;
nh = 15;

module my_gear() {
    // little nine-pointed gear form to fit snugly onto
    // motor gear.
    cylinder(d=4.75,h=10, center=true);
    for (i = [0:8]) {
        rotate([0,0,i*360/9]) {
            translate([2,0,0]) cube([3,1.5,10], center=true);
            translate([3.5,0,0]) cylinder(d=1.5,h=10, center=true);
        }
    }    
}

difference() {
    // printer is theoretically 120mm, actually 118mm wide
    cylinder(d=118,h=30);
    
    // remove inner volume other than center spindle
    difference() {
        translate([0,0,10]) cylinder(d=78,h=30);
        cylinder(d=15, h=22);
        cylinder(d=20, h=11);
    }
    
    // gear form and central shaft hole
    translate([0,0,17]) my_gear();
    cylinder(d=3,h=60,center=true);
    
    // big spoke holes
    for (i = [0:4]) {
        rotate([0,0,i*360/5]) translate([24,0,-1]) cylinder(d=26,h=22);
    }
    
    // little sinker holes, 2 sinkers each
    for (i = [0:nh-1]) {
        rotate([0,0,i*360/nh]) translate([49,0,6]) union() {
            cylinder(d=18.5, h=30);
            sphere(d=18.5);
        }
    }
    
    // version number on outside of rotor 
    translate([0,0,1]) rotate([0,180,0]) linear_extrude(2) text("1 2", halign="center", valign="center", font="lato black");    
}