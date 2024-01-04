$fn=64;

difference() {

    // exterior
    hull() {
        translate([25,0,0]) cylinder(d=20,h=6,center=true);
        translate([55,0,0]) cylinder(d=20,h=6,center=true);
    }
    
    
    // screw holes
    for (x = [55,40,25,10,-15,-30]) {
        translate([x,0,0]) cylinder(d=3,h=16,center=true);
    }
    
    // label
    translate([32.5,0,2]) linear_extrude(2) text("2", halign="center", valign="center");
}