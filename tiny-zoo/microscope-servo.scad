

sa = 10; // servo axis offset
sw = 20.5; // servo hole width
sl = 42; // servo hole length (with a bit extra to get the wires in)
sml = 48.5; // servo mount length
smw = 10; // servo mount width
sk = 58; // servo overall length

ld = 39;

zz = 8; // thickness of piece
th = 5;

sox = -10;
soy = 56;

lgp = 2; // lens gear pitch
lgt = 28; // lens gear teeth

sgt = lgt/2;

ofs = (lgt*lgp)/2 + (sgt*lgp)/2;

sz = 10;

$fn=64;

difference() {
    hull() {
        rotate([0,0,sz]) translate([sl/2-sa,0,0]) {
            translate([sml/2,smw/2,0]) cylinder(d=13,h=zz, center=true);
            translate([-sml/2,smw/2,0]) cylinder(d=13,h=zz, center=true);
            translate([sml/2,-smw/2,0]) cylinder(d=13,h=zz, center=true);
            translate([-sml/2,-smw/2,0]) cylinder(d=13,h=zz, center=true);
        }
            
            
        translate([0,ofs,0]) cylinder(d=ld+th*2,h=zz,center=true);
        translate([0,ofs,0]) rotate([0,0,sz]) {
        translate([-ld/2-5,0,0]) cube([10,2,zz],center=true);
    }
    
        translate([0,ofs,0])
            rotate([-90,0,sz])
                translate([-ld/2-6,0,0]) {
                    translate([0,0,1]) cylinder(d=zz,h=3);
                }   
    }
    
    rotate([0,0,sz]) translate([sl/2-sa,0,0]) {
        cube([sl,sw,zz+2],center=true);
        translate([sml/2,smw/2,0]) cylinder(d=1.75,h=zz+2,center=true, $fn=12);
        translate([-sml/2,smw/2,0]) cylinder(d=1.75,h=zz+2,center=true, $fn=12);
        translate([sml/2,-smw/2,0]) cylinder(d=1.75,h=zz+2,center=true, $fn=12);
        translate([-sml/2,-smw/2,0]) cylinder(d=1.75,h=zz+2,center=true, $fn=12);
    }
    translate([0,ofs,0]) rotate([0,0,sz]) {
        translate([-ld/2-9,0,0]) cube([20,2,zz+2],center=true);
    }
    translate([0,ofs,0]) cylinder(d=ld,h=zz+2,center=true);
 
    translate([0,ofs,0])
            rotate([-90,0,sz])
                translate([-ld/2-6,0,0]) {
                    cylinder(d=3,h=50,center=true);
                    cylinder(d=5,h=25);
                    translate([0,0,5]) cylinder(d=sz,h=25);
                }   

translate([-20,12,zz/2-1]) linear_extrude(2) text("1");
            }
//include <../saturnalia/gears.scad>
//translate([0,0,zz]) spur_gear(lgp, sgt, 1, 1);
//translate([0,ofs,zz]) spur_gear(lgp, lgt, 1, 1);    