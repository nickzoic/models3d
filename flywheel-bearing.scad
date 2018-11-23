$fn=100;

difference() {
    union() {
        cylinder(d=50,h=27);
        translate([-40,-25,0]) cube([80,10,27]);
        translate([-25,-25,0]) cube([50,25,27]);
    }
    
    // motor and screw holes
    translate([0,0,-1]) cylinder(d=38,h=11);
    translate([-12.5,0,0]) cylinder(d=3.5,h=30);
    translate([+12.5,0,0]) cylinder(d=3.5,h=30);
    translate([-12.5,0,14]) cylinder(d=6.5,h=30);
    translate([+12.5,0,14]) cylinder(d=6.5,h=30);
    
    // vent
    translate([-8,10,8]) cube([16,100,7]);
    
    // shaft hole
    difference() {
        cylinder(d=28,h=30);
        translate([-12.5,0,0]) cylinder(d=12,h=30);
        translate([+12.5,0,0]) cylinder(d=12,h=30);
        //translate([-50,-5,10]) cube([100,10,7]);
    }
    
    // bearing seat
    translate([0,0,16]) cylinder(d=33,h=30);
    translate([0,0,16.5]) cylinder(d=35.5,h=30);
    
    // mounts
    translate([-32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,7]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([-32.5,0,20]) rotate([90,0,0]) cylinder(d=6, h=100); 
    translate([+32.5,0,20]) rotate([90,0,0]) cylinder(d=6, h=100);
    
}
