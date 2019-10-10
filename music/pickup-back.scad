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

// plate dimensions

d1 = 95;  // outer diameter
t1 = 2;     // thickness below bevel
t2 = 2;     // thickness of 45deg bevel

msd = 82.5;  // mount screw holes diameter
msn = 6; // number of mount screws
msh = 6.5; // mount screw head
mss = 3.5; // mount screw shaft
msc = 1.5; // mount screw countersink

// pickup surround
st = 1;   // pickup surround thickness
sh = 1.5;   // pickup surround height
           // set to ph+st for closed pickup cover
sd = d1/2;  // circle in middle

$fn = 100;

difference() {
    // plate
    union() {
        cylinder(h=t1,d=d1);
        translate([0,0,t1]) cylinder(h=t2,d1=d1,d2=d1-t2*2);
    }
    // dent
    #translate([0,0,t1+t2-sh]) cylinder(d2=sd+sh*2,d1=sd,h=sh);
    
    // mounting screws
    for (aa = [0:msn]) {
        rotate([0,0,(aa+0.5)*360/msn+90]) union() {
            translate([msd/2,0,t1+t2-msc]) cylinder(d1=mss,d2=msh,h=msc);
            translate([msd/2,0,-1]) cylinder(d=mss,h=20);
        }
    }
}
