include <../saturnalia/gears.scad>

gp = 2; // gear pitch
gt = 14; // gear teeth
zz = 8;  // thickness

sht = 2;
shd = 21;
sid = 10;

difference() {
    union() {
        spur_gear(gp,gt,zz,zz);
        cylinder(d=gp*gt*.777,h=zz);
    }
    translate([0,0,zz-sht])
        cylinder(d=shd,h=sht+1);
    translate([0,0,-1]) cylinder(d=sid, h=zz+2);
    for (a=[-7,+7]) {
        for (b=[-3.5,0,+3.5]) {
            translate([a,b,-1])
                cylinder(d=1,h=zz+2);
            translate([b,a,-1])
                cylinder(d=1,h=zz+2);
        }
    }
}