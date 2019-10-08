// pickup dimensions

pl = 69; // length of pickup face
pw = 18;   // width of pickup face
px = 76.5; // distance between mount screws
ph = 5;  // pickup height above plate.

// pickup surround

st = 1.0;   // pickup surround thickness
sh = 1.0;   // pickup surround height
           // set to ph+st for closed pickup cover

// plate dimensions

d1 = 95;  // outer diameter
t1 = 0.75;     // thickness below bevel
t2 = 1.75;     // thickness of 45deg bevel

psh = 5.5;  // pickup screw head
pss = 3;  // pickup screw shaft
psc = 1;  // pickup screw countersink

msd = 82.5;  // mount screw holes diameter
msn = 6; // number of mount screws
msh = 5.5; // mount screw head
mss = 3; // mount screw shaft
msc = 1; // mount screw countersink

pa = -30;  // pickup angle

$fn = 100;

nx = 45;  // width of neck
ny = 40;  // offset of neck away from center


difference() {
    union() {
        cylinder(h=t1,d=d1);
        translate([0,0,t1]) cylinder(h=t2,d1=d1,d2=d1-t2*2);
        rotate([0,0,pa]) {
            hull() {
                translate([-pl/2+pw/4,+pw/4,0]) cylinder(d=pw/2+2*st, h=t1+t2+sh+1);
                translate([+pl/2-pw/4,+pw/4,0]) cylinder(d=pw/2+2*st, h=t1+t2+sh+1);
                translate([-pl/2+pw/4,-pw/4,0]) cylinder(d=pw/2+2*st, h=t1+t2+sh+1);
                translate([+pl/2-pw/4,-pw/4,0]) cylinder(d=pw/2+2*st, h=t1+t2+sh+1);
            }
        }
    }
    rotate([0,0,pa]) {
        hull() {
            translate([-pl/2+pw/4,+pw/4,-1]) cylinder(d=pw/2, h=ph+t1+t1+1);
            translate([+pl/2-pw/4,+pw/4,-1]) cylinder(d=pw/2, h=ph+t1+t1+1);
            translate([-pl/2+pw/4,-pw/4,-1]) cylinder(d=pw/2, h=ph+t1+t1+1);
            translate([+pl/2-pw/4,-pw/4,-1]) cylinder(d=pw/2, h=ph+t1+t1+1);
        }
        translate([-px/2,0,t1+t2]) cylinder(d=psh,h=10);
        translate([-px/2,0,t1+t2-psc]) cylinder(d1=pss,d2=psh,h=psc);
        translate([-px/2,0,-1]) cylinder(d=pss,h=20);
        
        translate([+px/2,0,t1+t2]) cylinder(d=psh,h=10);
        translate([+px/2,0,t1+t2-psc]) cylinder(d1=pss,d2=psh,h=psc);
        translate([+px/2,0,-1]) cylinder(d=pss,h=20);
    }
   
    for (aa = [0:msn]) {
        rotate([0,0,(aa+0.5)*360/msn+90]) union() {
            translate([msd/2,0,t1+t2-msc]) cylinder(d1=mss,d2=msh,h=msc);
            translate([msd/2,0,-1]) cylinder(d=mss,h=20);
        }
    }
    
    translate([-nx/2,ny,-1]) cube([nx,100,t1+t2+2]);
}
