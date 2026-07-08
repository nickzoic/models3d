difference() {
    hull() {
        cylinder(h=10,d=52);
        translate([60,0,0]) cylinder(h=10,d=25);
    }
    hull() {
        cylinder(h=10,d=39);
        translate([-20,0,0]) cylinder(h=10,d=37);
    }
    for (x = [40,50,60]) {
        translate([x,0,0]) cylinder(h=10,d=7);
        translate([x,0,9]) cylinder(h=10,d=13);
    }
    
    translate([0,0,5]) cylinder(h=5,d=46);
    translate([0,0,5]) cube([60,1,10],center=true);
}
    
translate([60,40,0]) rotate([0,0,180])    
difference() {
    hull() {
        cylinder(h=10,d=45);
        translate([60,0,0]) cylinder(h=10,d=25);
    }
    cylinder(h=2,d=35);
    translate([0,0,2]) cylinder(h=10,d=39);
    translate([0,0,9]) cylinder(h=1,d1=39,d2=41);
    hull() {
        translate([60,0,0]) cylinder(h=10,d=20);
        translate([65,0,0]) cylinder(h=10,d=19);
    }
    translate([0,0,5]) cube([60,1,10],center=true);
}
