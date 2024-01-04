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
        translate([-55,0,0]) cylinder(d=14,h=14,center=true);
        translate([55,0,0]) cylinder(d=14,h=14,center=true);
    }
    
    // slot
    hull() {
        translate([-55,0,-8]) cylinder(d=5,h=8,center=true);
        translate([55,0,-8]) cylinder(d=5,h=8,center=true);
    }
    
    // access hole
    hull() {
        translate([-45,0,+8]) cylinder(d=14,h=16,center=true);
        translate([-55,0,+8]) cylinder(d=14,h=16,center=true);
    }
    
    // screw holes
    for (x = [55,40,25,10,-15,-30]) {
        translate([x,0,+8]) cylinder(d=3,h=16,center=true);
    }
    
    // label
    translate([0,0,9]) linear_extrude(2) text("1", halign="center", valign="center");
}