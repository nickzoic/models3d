$fn=64;

difference() {

    // exterior
    hull() {
        translate([10,0,0]) cylinder(d=20,h=4,center=true);
        translate([55,0,0]) cylinder(d=20,h=4,center=true);
    }
    
    
    // screw holes
    for (x = [55,40,25,10,-55]) {
        translate([x,0,0]) cylinder(d=3,h=16,center=true);
    }
    
    // label
    translate([17.5,0,1]) linear_extrude(2) text("N", halign="center", valign="center");
    // label
    translate([32.5,0,1]) linear_extrude(2) text("M", halign="center", valign="center");
    // label
    translate([47.5,0,1]) linear_extrude(2) text("4", halign="center", valign="center");
}