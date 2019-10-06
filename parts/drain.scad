// the first one of these I tried to print, the flange on
// top was printed as a series of concentric circles which didn't
// adhere well to the rest and cracked off.  So I've made the
// flange slightly thicker and printed it with 100mm bottom
// thickness so that the whole thing is filled with plywood-
// like zigzag layers.  Hopefully that will be more robust!
// The spout part is all still concentric walls but it's under
// no load so should be okay.

$fn=64;

od1 = 42;
id1 = 32;
h1 = 3;

od2 = 37;
id2 = 32;
h2 = 3;

od3 = 24;
id3 = 21;
h3 = 8;

h4 = 17;

intersection() {
 
    union() {   
        difference() {
            cylinder(d=od1, h=h1);
            cylinder(d=id1, h=h1);
        }
        translate([0,0,h1]) difference() {
            cylinder(d=od2, h=h2);
            cylinder(d1=id1, d2=id2, h=h2);
        }
        translate([0,0,h1+h2]) difference() {
            cylinder(d1=od2,d2=od3,h=h3);
            cylinder(d1=id2,d2=id3,h=h3);
        }
        translate([0,0,h1+h2+h3]) difference() {
            cylinder(d=od3,h=h4);
            cylinder(d=id3,h=h4);
        }
    }
    rotate([15,0,0]) cube([200,200,53],center=true);
}