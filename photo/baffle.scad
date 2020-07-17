d1 = 36.5; // smaller diameter
d2 = 48.0; // larger diameter

h1 = 7;    // smaller height
h2 = 14;   // larger height

bv = 1;    // bevel size

d3 = 34;   // should be lens exit size

h3 = 10;   // angled bit height

cx = 10;   // sensor cutout.
cy = 7.5;
cr = 2;

$fn = 100;

difference() {
    union() {
        cylinder(d=d2, h=h2-bv);
        translate([0,0,h2-bv]) cylinder(d1=d2,d2=d2-2*bv,h=bv);
        translate([0,0,h2]) cylinder(d=d1,h=h1-bv);
        translate([0,0,h1+h2-bv]) cylinder(d1=d1,d2=d1-2*bv,h=bv);
    }
    hull() {
        translate([0,0,-1]) cylinder(d=d3,h=1);
        translate([-cx,-cy,0]) cylinder(r=cr, h=h3);
        translate([+cx,-cy,0]) cylinder(r=cr, h=h3);
        translate([-cx,+cy,0]) cylinder(r=cr, h=h3);
        translate([+cx,+cy,0]) cylinder(r=cr, h=h3);
    }
    hull() {
        translate([-cx,-cy,h3]) cylinder(r=cr, h=h1+h2-h3);
        translate([+cx,-cy,h3]) cylinder(r=cr, h=h1+h2-h3);
        translate([-cx,+cy,h3]) cylinder(r=cr, h=h1+h2-h3);
        translate([+cx,+cy,h3]) cylinder(r=cr, h=h1+h2-h3);
        translate([0,0,h1+h2]) cylinder(d=d1-4*bv);
    }
    translate([0,d2/2-bv*2,h2-0.5]) linear_extrude() text("v1.2",halign="center",valign="top",size=3);
    translate([0,-(d2/2-bv*2),h2-0.5]) linear_extrude() text("NM",halign="center",valign="bottom",size=3);
    
    translate([21,0,0]) cylinder(d=3,h=3);
    
    /*difference() {
        rotate([0,0,225]) cube([50,50,7]);
        cylinder(d=37,h=7);
    }*/
    
    translate([0,-23,0]) cube([20,10,14],center=true);
    
    intersection() {
        difference() {
            cylinder(d=46,h=2);
            cylinder(d=37,h=2);
        }
        rotate([0,0,165]) cube([50,50,2]);
    }
    
}