// Minimalist tray for Arduino and Arduino-like boards, to stop them sliding all
// over the desk.

// Measurements from https://blog.protoneer.co.nz/arduino-uno-and-mega-dimensions/
// Not actually tested yet but you get the idea.

$fn=16;

// Tweak the sizes here to make it push fit.
module pin() {
    cylinder(h=10,d=2.5);
    cylinder(h=4,d=5);
}

translate([14,2.5,0]) pin();
translate([15.3,2.5+5.1+27.9+15.2,0]) pin();
translate([14+1.3+50.8, 2.5+5.1, 0]) pin();
translate([14+1.3+50.8, 2.5+5.1+27.9]) pin();

difference() {
    cube([68.6,53.3,2]);
    translate([5,5,0]) cube([58.6,43.4,2]);
}
