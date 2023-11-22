$fn=100;

difference() {
union() {
    for (a=[0:2]) {
        translate([0,0,2*a]) cylinder(d1=20,d2=21.5,h=1);
        translate([0,0,2*a+1]) cylinder(d1=21.5,d2=20,h=1);
    }
        
    
    difference() {
        union() {
            cylinder(d=20,h=21);
            translate([0,0,11]) cylinder(d1=20,d2=24,h=2);
            translate([0,0,13]) cylinder(d1=24,d2=20,h=2);
            translate([0,0,21]) cylinder(d1=20,d2=24,h=2);
            translate([0,0,23]) cylinder(d1=24,d2=22,h=1);
        }
        cylinder(d=18,h=25);
    }
    translate([0,-5,0]) cylinder(d=5,h=27);
    translate([0,-5,27]) cylinder(d1=6,d2=4,h=2);
}

difference() {
    cylinder(d1=19,d2=17,h=1);
    cylinder(d1=13,d2=15,h=1);
}
translate([0,-5,-1]) {
    cylinder(d=2,h=31);
    cylinder(d1=8,d2=2,h=4);
 }
}
translate([0,0,5])
linear_extrude(2) text("v4", halign="center", size=8);
