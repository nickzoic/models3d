// sample
pdd = 35.5;

// TEETH
mod=1.25;
gth = 5;
gt1 = 23*2;
gt2 = 27*2;

// 608ZZ
bid = 8;
bod = 22;
bth = 7;

pld = 80;
plt = 20;

include <../lib/gears/gears.scad>

module stepper_cutout() {
   translate([8,0,0]) cylinder(d=28.5,h=19);
   translate([8,0,0]) cylinder(d1=30.5, d2=28.5,h=1);
   translate([8,17.5,0]) cylinder(d=3.5,h=14);
   translate([8,-17.5,0]) cylinder(d=3.5,h=14);
   translate([20,0,10]) cube([10,18,20],center=true);
   translate([20,0,10]) cube([14,9,20],center=true); 
   translate([0,0,-1]) cylinder(d1=9,d2=9.5,h=1);
   translate([0,0,-10]) cylinder(d=9,h=10);
   translate([0,0,-3]) hull() {
       translate([8,0,0]) cylinder(d=33,h=3);
       translate([8,17.5,0]) cylinder(d=10,h=3);
       translate([8,-17.5,0]) cylinder(d=10,h=3);
       translate([20,0,1.5]) cube([16,20,3],center=true);
       
   }
}

//translate([(gt2-gt1)*mod/2,0,19+gth*2])
translate([0,(gt1+gt2)*mod/2+25,0]) 
difference() {
    union() {
        spur_gear(mod,gt1,gth,0,optimized=false);
        cylinder(d=pdd+4, h=bth+6);
        }
    translate([0,0,bth+2]) cylinder(d=pdd,h=10);
    translate([0,0,-1]) cylinder(d=bod,h=bth+2);
}

difference() {
    cylinder(d1=(gt2*mod)+36,d2=(gt2*mod)+15,h=19+gth*2+3);
    translate([0,0,19+gth*2]) cylinder(d=(gt2*mod)+10,h=gth*2+1);
    translate([0,0,21]) cylinder(d=(gt2*mod)-10,h=20);
    
    translate([0,0,19]) rotate([180,0,0]) stepper_cutout();
    translate([0,-4.5,0]) cube([100,9,2]);
}
translate([0,0,19+gth*2]) ring_gear(mod, gt2, gth, 5);


translate([0,-(gt2*mod)/2-35,0]) {
    difference() {
        hull() {
            cylinder(d=10,h=bth);
            translate([mod*(gt2-gt1)/2,0,0]) cylinder(d=bid+2,h=bth);
        }
        intersection() {
            cylinder(d=5.5,h=8);
            cube([3.5,8,10],center=true);
        }
    }
    translate([mod*(gt2-gt1)/2,0,0]) {
        cylinder(d=bid+2,h=bth+1);
        cylinder(d=bid,h=bth*2);
    }
}