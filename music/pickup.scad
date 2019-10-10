/*
* printer settings:
* layer: 0.15mm
* walls: 1.5mm / 4 lines
* top: 0.6mm / 4 layers (increase this if fill shows through?)
  * set top layer angles to [0,60,120] because the usual
    45/135 looks terrible on the top layer.   
* bottom: 0mm / 0 layers
  * or make it a single layer for adhesion purposes.
* infill: 25% Gyroid
  * up to 50%.  Or tri-hex, really anything
    other than square grids should look nice.
* support: none
* adhesion: none
*/

// pickup dimensions

pl = 69; // length of pickup face
pw = 18;   // width of pickup face
px = 76.5; // distance between mount screws
ph = 5;  // pickup height above plate.
pr = pw/4;  // pickup corner radius (pw/2 for singles, pw/4 for humbuckers


// plate dimensions

d1 = 95;  // outer diameter
t1 = 2;     // thickness below bevel
t2 = 2;     // thickness of 45deg bevel

psh = 6.5;  // pickup screw head
pss = 3.5;  // pickup screw shaft
psc = 1.5;  // pickup screw countersink
pso = 0.5;    // pickup screw offset 

msd = 82.5;  // mount screw holes diameter
msn = 6; // number of mount screws
msh = 6.5; // mount screw head
mss = 3.5; // mount screw shaft
msc = 1.5; // mount screw countersink

pa = -30;  // pickup angle

// pickup surround
st = 1;   // pickup surround thickness
sh = 1.5;   // pickup surround height
           // set to ph+st for closed pickup cover
sd = d1/2;  // circle in middle


$fn = 100;

nx = 49.5;  // width of neck
ny = 39;  // offset of neck away from center


difference() {
    union() {
        // plate
        cylinder(h=t1,d=d1);
        translate([0,0,t1]) cylinder(h=t2,d1=d1,d2=d1-t2*2);
        
        // pickup surround
        rotate([0,0,pa]) {
            hull() {
                for (x = [-pl/2+pr,+pl/2-pr]) {
                    for (y = [-pw/2+pr,+pw/2-pr]) {
                        translate([x,y,t1+t2])
                            cylinder(r1=pr+st+sh, r2=pr+st, h=sh);
                    }
                }
            }
        }
        translate([0,0,t1+t2]) cylinder(d1=sd+sh*2,d2=sd,h=sh);
    }
    rotate([0,0,pa]) {
        
        // pickup cutout
        hull() {
            for (x = [-pl/2+pr,+pl/2-pr]) {
                for (y = [-pw/2+pr,+pw/2-pr]) {
                    
                    translate([x,y,-1]) cylinder(r=pr, h=ph+t1+t1+1);
                }
            }
        }
        
        // pickup screws & countersinks 
        for (x = [-px/2,+px/2]) {
            translate([x,pso,t1+t2]) cylinder(d=psh,h=10);
            translate([x,pso,t1+t2-psc]) cylinder(d1=pss,d2=psh,h=psc);
            translate([x,pso,-1]) cylinder(d=pss,h=20);
        }
    }
   
    // mounting screws
    for (aa = [0:msn]) {
        rotate([0,0,(aa+0.5)*360/msn+90]) union() {
            translate([msd/2,0,t1+t2-msc]) cylinder(d1=mss,d2=msh,h=msc);
            translate([msd/2,0,-1]) cylinder(d=mss,h=20);
        }
    }
    
    // fretboard cutout
    translate([-nx/2,ny,-1]) cube([nx,10,t1+t2+2]);
}
