/* spacers for transcat cat door */

d1 = 272;  // glass hole
d2 = 260;  // screw hole circle (guess)
tt = 20; // thickness of glass panel
hh = 5; // M4 screw
ww = 15; // width

rr = 2; // radius for edges
$fa=1;

minkowski() {
intersection() {
    translate([-d1/2,0,0]) cube([d1,d1,tt]);
translate([0,-d1/2+ww,0]) { difference() {
        cylinder(d=d1-rr*2,h=tt-rr*2);
        translate([0,d2/2,-1]) cylinder(h=tt,d=hh+rr*2);
        }
        }
}
sphere(r=rr, $fn=16);
}
