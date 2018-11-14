/*
   This is a case for a small 12V dimmer switch I bought on Ebay.
   There's an LED on the board so I've printed it in translucent PLA.
   
   License: CC-0 No Rights Reserved
   https://creativecommons.org/share-your-work/public-domain/cc0/
*/


$fn=100;

difference() {
    union() {
        // main box and mounting flanges
        cube([34,34,20]);
        translate([16.5,0,0]) cylinder(d=20,h=2);
        translate([16.5,34,0]) cylinder(d=20,h=2);
    }
    
    // cutout for interior & cutout for pot switch
    translate([1.5,1.5,1.5]) cube([31,31,19]);
    translate([-1,5.5,11.5]) cube([10,16,9]);
    translate([-1,13.5,11.5]) rotate([0,90,0]) cylinder(d=8,h=3);
    
    // wire holes.
    translate([31.5,9.5,9]) rotate([0,90,0]) cylinder(d=2.5,h=3);
    translate([31.5,14.5,9]) rotate([0,90,0]) cylinder(d=2.5,h=3);
    translate([31.5,19.5,9]) rotate([0,90,0]) cylinder(d=2.5,h=3);
    translate([31.5,24.5,9]) rotate([0,90,0]) cylinder(d=2.5,h=3);
    
    // mounting holes
    translate([16.5,-4.5,0]) cylinder(d=4,h=2);
    translate([16.5,38.5,0]) cylinder(d=4,h=2);
}

// PCB mounts
translate([28.5,4.5,1.5]) cylinder(d=3,h=2.5);
translate([28.5,4.5,3.5]) cylinder(d=2,h=10);
translate([28.5,29.5,1.5]) cylinder(d=3,h=2.5);
translate([28.5,29.5,3.5]) cylinder(d=2,h=10);

//lid
translate([35,0,0]) {
    cube([34,34,1.5]);
    difference() {
        // lid snap corners
        translate([2,2,0]) cube([30,30,6]);
        translate([3,3,0]) cube([28,28,9]);
        translate([0,7.5,0]) cube([33,20,9]);
        translate([7.5,0,0]) cube([20,33,9]);
    }
    
    // pot switch surround
    difference() {
        translate([32.5,6,1.5]) cube([1.5,15,8]);
        translate([31.5,13.5,9.5]) rotate([0,90,0]) cylinder(d=8,h=3);
    }
    
    // pcb retainers
    difference() {
        translate([5.5,4.5,0]) cylinder(d=4,h=14);
        translate([5.5,4.5,0]) cylinder(d=2.5,h=14);
    }
    difference() {
        translate([5.5,29.5,0]) cylinder(d=4,h=14);
        translate([5.5,29.5,0]) cylinder(d=2.5,h=14);
    }
}
