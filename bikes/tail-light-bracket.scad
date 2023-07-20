bw = 52;  // bracket width
xw = 5;    // extension width past bracket
xt = 2.5;    // xtension thickness

cw = 27;   // clip width
co = 2;  // clip offset (widthwise)
ch = 18;   // clip height
xh = 5;    // extra each side of clip

tt = 10;    // thickness of whole thing less extensions

td = 4;    // cable tie hole diameter
ts = 20 ;   // cable tie spacing

mw = 38;   // mounting hole width
md = 5;    // mounting hole diameter
nd = 9  ;    // nut diameter (point to point not AF)
nt = 6;     // nut thickness

$fn=64;

cr = 2;  // corner radius

module roundedcube(lx,ly,lz,cr) {
    hull() {
        for (sx=[-1,1]) for (sy=[-1,1]) for (sz=[-1,1]) {
            translate([sx*(lx/2-cr),sy*(ly/2-cr),sz*(lz/2-cr)]) sphere(r=cr);
        }
    }
}

difference() {
    translate([0,0,(tt+xt)/2]) roundedcube(bw+xw*2, ch+xh*2, tt+xt, cr);
    translate([0,0,tt+5]) cube([bw, ch+xh*2+2, 10], center=true);
    translate([co,0,0]) cube([cw,ch,100], center=true);
    
    for (x=[-1,1]) {
        translate([x*ts/2,0,tt]) cube([td, ch+xh*2, td], center=true);
        translate([x*mw/2,0,0]) cylinder(h=1000,d=md,center=true);
        translate([x*mw/2,0,0]) rotate([0,0,90]) cylinder(h=nt,d=nd,$fn=6);
    }
}