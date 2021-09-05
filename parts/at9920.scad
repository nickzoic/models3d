// a little ring mount to attach an Audio Technica AT9920
// stereo boundary mic to a flat surface securely.
// and hopefully without affecting the sound.

$fn=100;

difference() {
    union() {
        cylinder(d1=54,d2=58,h=2);
        translate([0,0,2]) cylinder(d=58,h=5);
        for (i = [0,156,204]) {
            rotate([0,0,i]) translate([31,0,0]) cylinder(d=10.5,h=9);
        }
        translate([-18,0,4.5]) cube([20,20,9], center=true);
        intersection() {
            cylinder(d1=54,d2=74,h=10);
            union() {
                translate([0,-28,0]) cylinder(d=5,h=9);
                translate([0,28,0]) cylinder(d=5,h=9);
            }
        }
    }
   
    translate([0,0,2]) cylinder(d=55,h=10);
    cylinder(d1=51,d2=55,h=2);
    for (i = [0,156,204]) {
        rotate([0,0,i]) translate([31,0,0]) { 
            cylinder(d=5,h=10);
            cylinder(d=9,h=0.5);
            translate([0,0,0.5]) cylinder(d1=9,d2=5,h=2);
        }
        
    }
    translate([-21,0,0]) cube([28,15,20], center=true);
}
