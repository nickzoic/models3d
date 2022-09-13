bw = 53;  // bracket width
xw = 5;    // extension width past bracket
xt = 3;    // xtension thickness

cw = 28;   // clip width
co = 2.5;  // clip offset (widthwise)
ch = 18;   // clip height
xh = 5;    // extra each side of clip

tt = 10;    // thickness of whole thing less extensions

td = 3;    // cable tie hole diameter

mw = 45;   // mounting hole width
md = 5;    // mounting hole diameter
nd = 10;    // nut diameter (point to point not AF
nt = 5;     // nut thickness

$fn=64;

difference() {
    cube([bw+xw*2,ch+xh*2,tt+xt], center=true);
    translate([0,0,tt/2+5]) cube([bw, ch+xh*2+2, 10], center=true);
    translate([co,0,0]) cube([cw,ch,tt+xt+2], center=true);
    translate([cw/2+co+td/2,0,0]) rotate([90,0,0]) cylinder(h=1000, d=td, center=true); 
    translate([-cw/2-co-td/2,0,0]) rotate([90,0,0]) cylinder(h=1000, d=td, center=true); 
    translate([mw/2,0,0]) cylinder(h=1000,d=md,center=true);
    translate([-mw/2,0,0]) cylinder(h=1000,d=md,center=true);
    translate([mw/2,0,-tt-xt/2]) cylinder(h=nt*2,d=nd,$fn=6);
    translate([-mw/2,0,-tt-xt/2]) cylinder(h=nt*2,d=nd,$fn=6);
}