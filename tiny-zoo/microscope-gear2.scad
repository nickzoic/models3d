include <../saturnalia/gears.scad>

// glue the round servo horn into this so
// this sits as close as possible to the 
// servo body

gp = 1; // gear pitch
gt = 25; // gear teeth

zz = 6;  // thickness

sht = 3.5; // servo horn shaft thickness
shd = 9; // servo horn shaft diameter
sod = 21; // servo horn outer diameter

difference() {
    union() {
        spur_gear(gp,gt,zz,zz);
        cylinder(d=sod+2,h=zz);
    }
    translate([0,0,sht])
        cylinder(d=sod,h=zz);
    cylinder(d=shd,h=zz);
    
   for (a=[0,90,180,270]) {
       rotate([0,0,a]) translate([7,0,0]) cylinder(d=2,h=zz);
       rotate([0,0,a+45]) translate([0,7,sht-1]) linear_extrude(2) text("2", size=3, halign="center",valign="center");
   }
}