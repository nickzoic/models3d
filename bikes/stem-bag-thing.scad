z0 = 2;   // thickness on top
z1 = 16;  // thickness of bolt
z2 = 15;  // thickness of gap
z3 = 10;  // thickness beneath

zz = z0 + z1 + z2 + z1 + z3;

y0 = 26;  // length of bolt cutout

d0 = 34;  // diameter of stem

x0 = 12;  // clearance for bolt
x1 = 10;  // trim offset


difference() {
    cylinder(d=d0+x0,h=zz);
    translate([x0/2,0,-1]) cylinder(d=d0,h=zz+2);
    translate([x1,-d0,-1]) cube([d0*2,d0*2,zz+2]);
    #translate([-y0,-y0/2,z3-z1/2]) cube([y0,y0,z1]);
    #translate([-y0,-y0/2,z3+z1+z2-z1/2]) cube([y0,y0,z1]);
}    