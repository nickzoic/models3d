$fn=64;

// needlepoint screws are 17 h
// drillers are 14 h
// can cut down to 9mm.
// head 10.5 mm D
// head 2.5mm T at center, 1.5 at edge
// threads 4mm
// hole size 3mm

difference() {

    // exterior
    hull() {
        translate([-55,0,0]) cylinder(d=20,h=20,center=true);
        translate([55,0,0]) cylinder(d=20,h=20,center=true);
    }
    
    // interior
    hull() {
        translate([-55,0,-4]) cylinder(d=14,h=4,center=true);
        translate([55,0,-4]) cylinder(d=14,h=4,center=true);
        translate([-55,0,0]) cylinder(d1=14,d2=1,h=8,center=true);
        translate([55,0,0]) cylinder(d1=14,d2=1,h=8,center=true);
    }
    
    // slot
    hull() {
        translate([-55,0,-8]) cylinder(d=5,h=10,center=true);
        translate([55,0,-8]) cylinder(d=5,h=10,center=true);
    }
    
    // access hole
    hull() {
        translate([-55,0,+6]) cylinder(d=14,h=16,center=true);
        translate([-5,0,+6]) cylinder(d=14,h=16,center=true);
    }
    
    // screw holes
    for (a = [10, 25, 40, 55]) {
        translate([a,0,+8]) cylinder(d=3,h=16,center=true);
    }
    
    // label
    translate([17.5,0,9]) linear_extrude(2) text("N", halign="center", valign="center");
    translate([32.5,0,9]) linear_extrude(2) text("M", halign="center", valign="center");
    translate([47.5,0,9]) linear_extrude(2) text("4", halign="center", valign="center");
    
    // testing
    //translate([0,-500,0]) cube(1000, center=true);
}