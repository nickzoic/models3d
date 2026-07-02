// what was wrong with version 1
// * not thick enough, too flexy, make it 18mm
// * if it's that thick, it'd better be the mounting bracket as well
// * needs chamfer on lens tube
// * clamp screw end too fragile
// * servo edge can be left open


sa = 10; // servo axis offset
sw = 20.5; // servo hole width
sl = 40.5; // servo hole length
sml = 48.5; // servo mount length
smw = 10; // servo mount width
sk = 58; // servo overall length

ld = 39;

zz = 18; // thickness of piece
th = 4;

sox = -10;
soy = 56;

lgp = 1; // lens gear pitch
lgt = 50; // lens gear teeth

sgt = lgt/2;

ofs = (lgt*lgp)/2 + (sgt*lgp)/2;

sz = 30;

$fn=64;

difference() {
    hull() {
        rotate([0,0,sz]) translate([sl/2-sa,0,0]) {
            translate([sml/2,smw/2,0]) cylinder(d=10,h=zz, center=true);
            translate([-sml/2,smw/2,0]) cylinder(d=10,h=zz, center=true);
            translate([sml/2,-smw/2,0]) cylinder(d=10,h=zz, center=true);
            translate([-sml/2,-smw/2,0]) cylinder(d=10,h=zz, center=true);
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
             
    rotate([0,0,sz]) {
     translate([50,0,0]) {
         cylinder(d=14,h=zz,center=true);
     }
     translate([50,50,0]) {
         cylinder(d=14,h=zz,center=true);
     }
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
    translate([0,ofs,-zz/2])
    cylinder(d1=ld+2,d2=ld,h=1);
    translate([0,ofs,zz/2-1])
    cylinder(d1=ld,d2=ld+2,h=1);
    
    translate([0,ofs,0])
            rotate([-90,0,sz])
                translate([-ld/2-6,0,0]) {
                    cylinder(d=3,h=50,center=true);
                    cylinder(d=5,h=25);
                    translate([0,0,7]) cylinder(d=9,h=25);
                }   
rotate([0,0,sz]) {
     translate([50,0,0]) {
         cylinder(d=8,h=zz+2,center=true);
     }
     translate([50,50,0]) {
         cylinder(d=8,h=zz+2,center=true);
     }
 }
translate([-20,12,zz/2-1]) linear_extrude(2) text("2");
 
                }

/*
include <../saturnalia/gears.scad>

color("red") {
                
spur_gear(lgp, sgt, 1, 1);
translate([0,ofs,0]) spur_gear(lgp, lgt, 1, 1);
}
                */