$fn=100;

d1 = 6;  // measure width of D
d2 = 4.5;  // measure flat of D
h1 = 10;

difference() {
    cylinder(d1=20,d2=17,h=12);
    
difference() {
    cylinder(d=d1,h=h1);
    translate([d2-d1/2,-d1/2,-1]) cube([d1/2,d1,h1+2]);
}

difference() {
    translate([0,0,11.5]) cylinder(d=7,h=1);
    translate([0,0,11]) cylinder(d=5,h=2);
}
for (a=[0:7]) {
    rotate([0,0,a*45])
    hull() {
        translate([5,0,11.5]) cylinder(d=1,h=1);
        translate([7,0,11.5]) cylinder(d=1,h=1);
    }
}
}