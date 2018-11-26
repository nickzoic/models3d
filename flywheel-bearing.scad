// 1.1 : horizontal motor mounts, single top vent
// 1.2 : diagonal motor mounts, long base, dual side vents

$fn=100;

difference() {
    union() {
        cylinder(d=50,h=50);
        translate([-40,-25,0]) cube([80,10,50]);
        translate([-25,-25,0]) cube([50,25,50]);
        rotate([0,-90,-45]) translate([33.5,0,21]) linear_extrude(5) text("1.2", font="Bitstream Charter", halign="center", valign="center");
    }
    
    // motor and screw holes
    translate([0,0,-1]) cylinder(d=38,h=34);
    rotate([0,0,45]) {
        translate([-12.5,0,23]) cylinder(d=3.5,h=30);
        translate([+12.5,0,23]) cylinder(d=3.5,h=30);
        translate([-12.5,0,37]) cylinder(d=6.5,h=30);
        translate([+12.5,0,37]) cylinder(d=6.5,h=30);
    }
    
    // vent
    //translate([-8,10,8]) cube([16,100,7]);
    translate([13,-4.5,33]) cube([100,9,5]);
    translate([-113,-4.5,33]) cube([100,9,5]);
    

    
    // motor and screw holes
    translate([0,0,-1]) cylinder(d=38,h=11);
    translate([-12.5,0,0]) cylinder(d=3.5,h=30);
    translate([+12.5,0,0]) cylinder(d=3.5,h=30);
    translate([-12.5,0,13.5]) cylinder(d=6.5,h=30);
    translate([+12.5,0,13.5]) cylinder(d=6.5,h=30);
    
    // vent
    translate([-8,10,10]) cube([16,100,5]);
    
    // vent holes
    translate([0,0,23]) {
    difference() {
        cylinder(d=28,h=30);
        rotate([0,0,45]) cube([100,12,60], center=true);
        cylinder(d=18,h=30);  // check dia
    }
    
    cylinder(d=12,h=30); // check dia
    }

    // bearing seat
    translate([0,0,39]) cylinder(d=33,h=30);
    translate([0,0,39.5]) cylinder(d=35.5,h=30);
    
    // mounts
    translate([-32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([-32.5,0,25]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,25]) rotate([90,0,0]) cylinder(d=6, h=100);
    translate([-32.5,0,43]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,43]) rotate([90,0,0]) cylinder(d=6, h=100);
    
    translate([0,20,-10]) rotate([0,90,0]) cylinder(d=60,h=80,center=true);
}
