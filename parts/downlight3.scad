$fn=100;

difference() {
    union() {
        translate([0,0,3]) difference() {
            sphere(d=118);
            sphere(d=114);
        };
        difference() {
            
            cylinder(h=6,d=118,center=true);
            cylinder(h=8,d=90,center=true);
        }
    }
    translate([0,0,-100]) cube([200,200,200], center=true); 
    translate([43,-60,-20]) {
    rotate([0,-45,0]) cube([120,120,120]);
    };
}

translate([-12,20,3]) rotate([180,0,-28])
difference() {
    intersection() {
        cylinder(h=3,d=118);
        translate([43,-60,-20]) {
            rotate([0,-45,0]) cube([120,120,120]);
        };
    }
    translate([0,0,-1]) cylinder(h=5,d=90);
}

hull() {
    translate([-30,20,0]) cylinder(d=10,h=1);
    translate([-30,-20,0]) cylinder(d=10,h=1);
}