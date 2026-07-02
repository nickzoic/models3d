
sw = 20;
sl = 40;
sh = 48.5;
sg = 10;
sk = 55;

ld = 39;

zz = 20;
th = 3;

sox = -10;
soy = 56;

lgp = 2; // lens gear pitch
lgt = 28; // lens gear teeth

difference() {
    hull() {
        cylinder(d=ld+2*th,h=zz);
        translate([sox-th,soy-th,0]) cube([sk,sw+2*th,zz]);
    }
    translate([0,0,-1]) cylinder(d=ld,h=zz+2);
    translate([sox,soy,-1]) cube([sl,sw,zz+2]);
}
        