$fn=100;
difference() {
    union() {
        for (a = [0 : 45 : 360]) {
          rotate([0,0,a]) translate([0,18,0]) rotate([180,25,0]) cylinder(d=14,h=50,center=true);
        }   
        translate([0,0,-26]) cylinder(d1=70,d2=40,h=20);
    }
    union() {
        for (a = [0 : 45 : 360]) {
          rotate([0,0,a]) translate([0,18,0]) rotate([180,25,0]) cylinder(d1=12,d2=10,h=52,center=true);  
        }   
        translate([0,0,-24]) cylinder(d1=22,d2=22,h=22);
    }
}