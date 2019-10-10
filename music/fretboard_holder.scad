w1 = 49.5;
w2 = 44.4;
l = 104;

difference() {
    cube([max(w1,w2)+10,l,15],center=true);
    hull() {
        translate([0,l/2,0]) cylinder(d=w1,h=5,center=true);
        translate([0,-l/2,0]) cylinder(d=w2,h=5,center=true);
    }
    hull() {
        translate([0,l/2,5]) cylinder(d1=w1-4,d2=w1,h=7,center=true);
        translate([0,-l/2,5]) cylinder(d1=w2-4,d2=w2,h=7,center=true);
    }
    translate([0,l/2-10,-3.5]) linear_extrude(2) text(str(w1), halign="center", valign="center");
    translate([0,10-l/2,-3.5]) linear_extrude(2) text(str(w2), halign="center", valign="center");
    rotate([0,0,90]) translate([0,0,-3.5]) linear_extrude(2) text(str(l), halign="center", valign="center");
}