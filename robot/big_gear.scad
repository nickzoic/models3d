include <./gears.scad>;

hh = 10;    // z-height
nt = 100;  // number of teeth
id = 305;  // inner diameter
td = id * 1.11;  // tooth diameter
gm = td / nt; // gear module (tooth pitch)
ns = 10; // number of segments
np = ns / 2;  // number to actually print
hd = 5;  // screw hole diameter

for (n = [0:np-1]) {
    translate([26*n-id/2,0,0]) {
        difference() {
            intersection() {
                rotate([0,0,180/nt]) spur_gear(gm,nt,hh,id);
                rotate_extrude(angle=360/ns) polygon(points=[
                    [id/2,0], [id/2,hh], [1.1*td/2,hh], [1.1*td/2,0]
                ]);
            }
            for (a = [3, 180/ns, 360/ns-3]) {
                rotate([0,0,a]) {
                    translate([id*1.04/2, 0, hh-2]) cylinder(d1=hd,d2=hd+4,h=2); 
                    translate([id*1.04/2, 0, -1]) cylinder(d=hd,h=hh+2);
                }
            }
        }
    }
}

translate([-25,20,0]) spur_gear(gm, 8, hh, 8);