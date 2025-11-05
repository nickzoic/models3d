$fn=100;
d1 = 36.4;
d2 = 41;
tt = 2;
hh = 50;

difference() {
translate([0,0,25])
rotate([0,160,0])
difference() {
    cylinder(d1=d2+tt*2,d2=d1+hh+tt*2,h=hh);
    translate([0,0,tt]) cylinder(d1=d1-1, d2=d1+hh, h=hh-1);
    translate([0,0,-1]) cylinder(d=d2+1,h=tt+2);
    translate([-23,0,35]) sphere(d=25);
    translate([-58,0,20]) sphere(d=50);
}
translate([0,0,-100]) cube(200,center=true);
}