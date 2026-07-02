ld1 = 39;
h1 = 10;

ofs = 36;

ww = 80;
tt = 10;

$fn=128;

difference() {
    
    hull() {
        cylinder(h=h1,d=ld1+12);
        translate([-ww/2,ofs,0]) cube([ww,tt,h1]);
        translate([0,-ld1/2-5,h1/2])
        rotate([0,90,0]) cylinder(d=h1,h=28, center=true);
    }
    translate([0,0,-1]) cylinder(h=h1+2,d=ld1);
    for (x = [ww/2-10,10-ww/2])
        translate([x,0,h1/2]) {
            rotate([90,0,0]) cylinder(d=5,h=100,center=true);
            translate([0,ofs,0]) rotate([90,0,0]) cylinder(d=8,h=100);
        }
    translate([-1,-ld1,0]) cube([2,ld1,20]);
        translate([0,-ld1/2-5,h1/2])
        rotate([0,90,0]) {
            cylinder(d=3,h=50, center=true);
            cylinder(d=5,h=50);
            translate([0,0,10]) cylinder(d=8,h=50);
    }
    translate([0,ofs-10,h1-1]) linear_extrude(2) text("tiny-zoo 1",halign="center");
}