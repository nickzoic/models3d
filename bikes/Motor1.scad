$fn=100;

dist1 = 16;
dist2 = 19;
screw = 3;
hole = 9;
outer = 28;
thick = 2;

module m3() {
    cylinder(d1=5,d2=3,h=1);
    cylinder(d=3,h=thick);
}

difference() {
    hull() {
        cylinder(d=outer+4, h=thick*2, center=true);
        translate([35,35,0]) cylinder(d=outer+4,h=thick*2,center=true);
    }
    translate([35,35,0]) cylinder(d=10, h=thick*3, center=true);
    rotate([0,0,45])
    translate([outer/2+4,0]) cube([4,9,thick*3],center=true);
    cylinder(d=outer, h=thick+1);
    cylinder(d=hole, h=thick*3,center=true);
    translate([-dist1/2,0,-thick]) m3();    translate([+dist1/2,0,-thick]) m3();
    translate([0,-dist2/2,-thick]) m3();
    translate([0,+dist2/2,-thick]) m3();

}

translate([-10,40,3]) 
difference() {
    for(a=[0:5:90]) rotate([0,0,a]) cube([24,24,10],center=true);
    difference() {
        cylinder(d=28,h=12,center=true);
        for(a=[0:60:359]) {
            rotate([0,0,a]) {
                translate([14,0,-5])
                cube([4,8,2],center=true);
            }
        }
    }
    rotate_extrude() {
        translate([17,0]) circle(d=3);
    }
}