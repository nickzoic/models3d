rd = 51;     // ring diameter
rh = 2.8;    // ring height
od = 62;     // outer diamter
ot = 3.5;     // outer thickness
md = 69.6;   // mount circle diameter
ma = 30;     // mount offset angle (check)
mh = 9.3;  // mount height (below outer)
mod = 4.8;  // mount cylinder diameter
mid = 2; // mount cylinder inner

tl = 4;      // tag length
tw = 2.5;      // tag width

ow = 80;     // overall width internal
oh = 25;     // overall height internal
wt = 2.5;      // wall thickness

$fn=50;

difference() {
    translate([0,0,oh/2+wt]) cube([ow+wt*2,ow+wt*2,oh+wt*2],center=true);
    translate([0,0,50+ot+wt]) cube([ow,ow,100], center=true);
    cylinder(d=rd, h=100);
    translate([0,0,wt]) cylinder(d=od,h=oh/2);
    translate([0,tl,wt+ot/2]) cube([tw,od,ot], center=true);
}
for (a=[ma,ma+90,ma+180,ma+270]) {
    rotate([0,0,a])
    translate([md/2,0,wt]) {
        difference() {
            cylinder(d=mod,h=mh);
            cylinder(d=mid,h=mh);
        }
    }
}
//difference() {
//    translate([oh/2-ot,0,0]) cylinder(d=od+tl/2,h=ot])