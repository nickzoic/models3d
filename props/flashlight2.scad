$fn=100;

difference() {
    union() {
        // end ring
        hull() {
           cylinder(d=75,h=20);
           translate([0,0,5]) cylinder(d=85,h=10,$fn=12);
        }
        // cone
        translate([0,0,20]) cylinder(d1=75,d2=50,h=13.5);
        
        // grip
        translate([0,0,25]) for (a=[0:10:60]) {
            rotate([0,0,a])
            cylinder(d=55,h=40,$fn=6);
        }
        /*intersection() {
            cylinder(h=200,d=60);
            union() {
                translate([0,0,110]) rotate([0,90,0]) cylinder(d=35,h=100);
                translate([20,-15,50]) cube([30,30,60]);     }
        }
        translate([25,00,105]) sphere(d=25);
        */
        
        translate([0,0,47.5]) rotate([0,90,0]) cylinder(h=30, d=20);
        translate([27.5,0,47.5]) sphere(d=15);
    }
    
    // reflector
    sphere(d=70);
    
    // torch bore
    cylinder(d=30,h=100);
    
        translate([0,0,40]) cylinder(d=41,h=130);
    translate([0,0,63]) cylinder(d1=41,d2=43,h=2);
    cube(1000);
}

difference() {
// grip
        for (a=[0:10:60]) {
            rotate([0,0,a])
            cylinder(d=55,h=20,$fn=6);
        }
        translate([0,0,18]) cylinder(d1=41,d2=43,h=2);
        difference() {
            translate([0,0,2]) cylinder(d=41,h=130);
            cylinder(d=20,h=100);
        }
        cylinder(d=15,h=100);
   
    rotate([0,0,-30]) translate([0,-12,1]) rotate([180,0,0]) linear_extrude(2) text("D", halign="center", size=10);
    translate([0,-10,1]) rotate([180,0,0]) 
    linear_extrude(2) text("V", halign="center", size=12.5);
    rotate([0,0,30]) translate([0,-12,1]) rotate([180,0,0]) 
    linear_extrude(2) text("S", halign="center", size=10);
        cube(1000);
}
