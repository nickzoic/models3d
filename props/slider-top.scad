$fn=64;

difference() {

    // exterior
    hull() {
        translate([-55,0,0]) cylinder(d=20,h=6,center=true);
        translate([55,0,0]) cylinder(d=20,h=6,center=true);
    }
    
    
    // screw holes
    for (x = [55,40,25,10,-55]) {
        translate([x,0,0]) cylinder(d=3,h=16,center=true);
    }
    
    // label
    translate([-22.5,0,2]) linear_extrude(2) text("NMv3", halign="center", valign="center");
}