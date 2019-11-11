// a giant gear suitable for screwing to wood and a little pinion to turn it with.

include <./gears.scad>;

hh = 8;    // z-height
nt = 9*13;  // number of teeth
id = 305;  // inner diameter
td = id * 1.1;  // tooth diameter
gm = td / nt; // gear module (tooth pitch)
ns = 9; // number of segments
np = 3;  // number to actually print
hd = 4;  // screw hole diameter
nw = 5; // number of screws
for (n = [0:np-1]) {
    translate([24*n-id/2,0,0]) {
        difference() {
            intersection() {
                union() {
                    rotate([0,0,180/nt]) spur_gear(gm,nt,hh,id);
                    cylinder(d=td*0.975,h=hh); // hide rounding errors in gear library
                }
                rotate_extrude(angle=360/ns) polygon(points=[
                    [id/2,0], [id/2,hh], [1.1*td/2,hh], [1.1*td/2,0]
                ]);
            }
            for (s = [1:nw]) {
                rotate([0,0,(s-0.5)*360/ns/nw]) {
                    translate([id*1.035/2, 0, hh-2]) cylinder(d1=hd,d2=hd+4,h=2); 
                    translate([id*1.035/2, 0, -1]) cylinder(d=hd,h=hh+2);
                }
            }
        }
    }
}

translate([-17,20,0]) spur_gear(gm, 8, 12, 6);