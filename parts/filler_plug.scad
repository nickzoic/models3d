$fn=100;

difference() {
union() {
    for (a=[0:2]) {
        translate([0,0,2*a]) cylinder(d1=20,d2=22,h=1);
        translate([0,0,2*a+1]) cylinder(d1=22,d2=20,h=1);
    }
        
    
    difference() {
        union() {
            cylinder(d=20,h=12);
            translate([0,0,9]) cylinder(d1=20,d2=24,h=2);
            translate([0,0,11]) cylinder(d1=24,d2=22,h=1);
        }
        cylinder(d=18,h=13);
    }
    translate([5,0,0]) cylinder(d=4.5,h=10);
    translate([5,0,10]) cylinder(d1=4.5,d2=3.5,h=1);
}
translate([5,0,-1]) {
    cylinder(d=2,h=20);
    cylinder(d1=4,d2=2,h=2);
 
}
}