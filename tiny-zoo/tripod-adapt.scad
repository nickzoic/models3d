difference() {
    hull() {
        cylinder(h=8,d=48);
        //translate([-10,0,0]) cylinder(h=8,d=48);
        translate([70,0,0]) cylinder(h=8,d=25);
    }
    hull() {
        cylinder(h=8,d=39);
        translate([-20,0,0]) cylinder(h=8,d=37);
    }
    translate([70,0,0]) cylinder(h=8,d=6.5);
    translate([0,0,5]) cylinder(h=3,d=46);
    translate([42.5,0,0]) cylinder(h=8,d=25);
}
    
translate([60,40,0]) rotate([0,0,180])    
difference() {
    hull() {
        cylinder(h=8,d=45);
        translate([70,0,0]) cylinder(h=8,d=25);
    }
    cylinder(h=8,d=39);
    translate([0,0,7]) cylinder(h=1,d1=39,d2=41);
    translate([40,0,0]) cylinder(h=8,d=25);
    hull() {
        translate([70,0,0]) cylinder(h=8,d=20);
        translate([80,0,0]) cylinder(h=8,d=19);
    }
}
