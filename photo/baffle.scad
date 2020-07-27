d1 = 36.5; // smaller diameter
d2 = 48.0; // larger diameter

h1 = 7;    // smaller height
h2 = 14;   // larger height

bv = 1;    // bevel size

d3 = 34;   // should be lens exit size

h3 = 20;   // angled bit height

cx = 9;   // sensor cutout.
cy = 6.5;
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
    translate([0,d2/2-bv*2,h2-0.5]) linear_extrude() text("v1.5",halign="center",valign="top",size=3);
    rotate([0,0,-40]) translate([0,-(d2/2-bv*2),h2-0.5]) linear_extrude() text("nick",halign="center",valign="bottom",size=3);
    rotate([0,0,0]) translate([0,-(d2/2-bv*2),h2-0.5]) linear_extrude() text("zoic",halign="center",valign="bottom",size=3);
    
    translate([21,0,4]) cylinder(d1=3,d2=1,h=2);
    translate([21,0,0]) cylinder(d=3,h=4);
    translate([21,0,0]) cylinder(d1=4,d2=3,h=1);
    
    rotate([0,0,-20])
    translate([0,-24,0]) cube([4,12,60],center=true);
    
    intersection() {
        difference() {
            cylinder(d=50,h=10);
            cylinder(d=36,h=10);
        }
        rotate([0,0,245]) cube([50,50,10]);
        rotate([0,0,220]) cube([50,50,10]);
    }
    intersection() {
        difference() {
            cylinder(d1=45,d2=45,h=3);
            cylinder(d1=37,d2=37,h=3);
        }
        rotate([0,0,135]) cube([50,50,3]);
    }
    rotate([0,0,225]) translate([20.5,0,0]) cylinder(d=6.5,h=2);
    
}