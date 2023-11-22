$fn=100;

difference() {
union() {
    for (a=[0:2]) {
        translate([0,0,2*a]) cylinder(d1=20,d2=21.5,h=1);
        translate([0,0,2*a+1]) cylinder(d1=21.5,d2=20,h=1);
    }
        
    
    difference() {
        union() {
            cylinder(d=20,h=14);
            translate([0,0,11]) cylinder(d1=20,d2=24,h=2);
            translate([0,0,13]) cylinder(d1=24,d2=22,h=1);
        }
        cylinder(d=18,h=15);
    }
    translate([0,-5,0]) cylinder(d=4.5,h=14);
    translate([0,-5,14]) cylinder(d1=4.5,d2=3.5,h=1);
}

difference() {
    cylinder(d1=18,d2=16,h=1);
    cylinder(d1=12,d2=14,h=1);
}
translate([0,-5,-1]) {
    cylinder(d=2.5,h=20);
    cylinder(d1=6,d2=2,h=3);
 }
}
translate([0,0,5])
linear_extrude(2) text("v3", halign="center", size=8);
