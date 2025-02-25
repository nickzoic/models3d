$fn=100;

difference() {
    union() {
        translate([0,0,20]) cylinder(d1=90,d2=60,h=20);
        
        translate([0,0,40]) cylinder(d=60,h=20);
        intersection() {
            cylinder(h=200,d=60);
            union() {
                translate([0,0,110]) rotate([0,90,0]) cylinder(d=30,h=100);
                translate([20,-15,50]) cube([30,30,60]);     }
        }
        translate([25,00,105]) sphere(d=25);
        
        hull() {
           cylinder(d=90,h=20);
           translate([0,0,5]) cylinder(d=100,h=10,$fn=12);
        }
    }
    sphere(d=80);
    cylinder(d=25,h=100);
    difference() {
        translate([0,0,50]) cylinder(d=55,h=130);
        translate([0,0,50]) cylinder(d=30,h=30);
    }
}

translate([100,0,0])
difference() {
    union() {
        translate([0,0,20]) cylinder(d=60,h=10);
        
        hull() {
           cylinder(d=60,h=20);
           translate([0,0,5]) cylinder(d=70,h=10,$fn=12);
        }
    }
    cylinder(d=25,h=100);
    difference() {
        translate([0,0,10]) cylinder(d=55,h=30);
        translate([0,0,10]) cylinder(d=30,h=30);
    }
    translate([3,22.5,0]) cylinder(d=4,h=10);
    translate([-3,22.5,0]) cylinder(d=4,h=10);
    rotate([0,0,-25]) translate([0,-16.5,2]) rotate([180,0,0]) linear_extrude(2) text("D", halign="center", size=10);
    translate([0,-15,2]) rotate([180,0,0]) 
    linear_extrude(2) text("V", halign="center", size=12.5);
    rotate([0,0,25]) translate([0,-16.5,2]) rotate([180,0,0]) 
    linear_extrude(2) text("S", halign="center", size=10);
}
