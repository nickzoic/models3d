d1 = 13;
d2 = 17;
d3 = 19;
h1 = 13;
h2 = 26;
h3 = 10;
hm = h3 + 1.5;

rr = 61;
rm = 11;
$fn=100;

difference() {
    union() {
        translate([0,0,h3]) cylinder(h=h2-h1,d1=d3+4,d2=d2+3);
        translate([0,0,h2-h1+h3]) cylinder(h=h1,d1=d2+3,d2=d1+2);
        cylinder(h=h3,d=d3+4);
        //translate([0,d3/2+0.33,h3]) rotate([-90,0,0]) cylinder(d=rm+2,h=1);
    }
    translate([0,0,h3]) cylinder(h=h2-h1,d1=d3,d2=d2);
    translate([0,0,h2-h1+h3]) cylinder(h=h1,d1=d2,d2=d1);
    //cube(100);
    cylinder(h=h3,d=d3);
    for (a = [0:90:270]) {
        rotate([0,0,a]) translate([0,d3/2+0,hm]) rotate([-90,0,0]) cylinder(d=rm,h=6);
        rotate([0,0,a]) translate([0,d3/2-1,hm]) rotate([-90,0,0]) cylinder(d=rm-3,h=6);}
}

difference() {
    cylinder(d1=d3+4,d2=d3+14,h=5);
    translate([0,0,rr+2.5]) rotate([90,0,0]) cylinder(r=rr,h=d3*2,center=true, $fn=200);
    cylinder(h=h3,d=d3);
}
