// 1.1 : horizontal motor mounts, single top vent
// 1.2 : diagonal motor mounts, long base, dual side vents
// 1.3 : sticky-out nose

$fn=100;

difference() {
    union() {
        cylinder(d=50,h=50);
        translate([-40,-25,0]) cube([80,10,28]);
        translate([-25,-25,0]) cube([50,25,28]);
        rotate([0,-90,0]) translate([17.5,-10,21]) linear_extrude(5) text("1.3", font="Bitstream Charter", halign="center", valign="center");
    }
    
    // motor and screw holes
    translate([0,0,-1]) cylinder(d=38,h=34);
    rotate([0,0,45]) {
        translate([-12.5,0,23]) cylinder(d=3.5,h=30);
        translate([+12.5,0,23]) cylinder(d=3.5,h=30);
        translate([-12.5,0,37]) cylinder(d=6.5,h=30);
        translate([+12.5,0,37]) cylinder(d=6.5,h=30);
    }
    
    // side vents
    translate([13,-4.5,33]) cube([100,9,5]);
    translate([-113,-4.5,33]) cube([100,9,5]);
    
    // motor nose support 
    translate([0,0,23]) {
        difference() {
            cylinder(d=28,h=30);
            rotate([0,0,45]) cube([100,12,60], center=true);
            cylinder(d=19.5,h=30);
        }       
        cylinder(d=13.25,h=30);
    }

    // bearing seat
    translate([0,0,39]) cylinder(d=33,h=30);
    translate([0,0,39.5]) cylinder(d=35.5,h=30);
    
    // mounts
    translate([-32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([-32.5,0,21]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,21]) rotate([90,0,0]) cylinder(d=6, h=100);
    
    //translate([0,20,-10]) rotate([0,90,0]) cylinder(d=60,h=80,center=true);
    translate([0,29.5,-30]) rotate([35,0,0]) cube([100,100,100], center=true);
}
