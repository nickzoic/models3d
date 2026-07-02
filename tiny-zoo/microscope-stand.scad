ld = 39;
lh = 15;
fd = 36;

$fn = 100;

difference() {
    hull() {
        translate([0,0,fd]) cylinder(d=ld+4,h=lh);
        translate([0,0,-2.5]) cube([63,63,0.1], center=true);
    }
    translate([0,0,fd]) cylinder(d=ld,h=lh+1);
    hull() {
        translate([0,0,fd]) cylinder(d=ld-4,h=1);
        translate([0,0,0]) cube([56,56,0.1], center=true);
    }
    hull() {
        translate([50,0,0]) cube([100,56,0.1], center=true);
        translate([50,0,10]) cube([100,42,20], center=true);
    }
}