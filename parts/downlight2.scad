$fn=100;

difference() {
    union() {
        translate([0,0,3]) difference() {
            sphere(d=120);
            sphere(d=116);
        };
        difference() {
            
            cylinder(h=6,d=120,center=true);
            cylinder(h=8,d=85,center=true);
        }
    }
    translate([0,0,-100]) cube([200,200,200], center=true); 
    translate([20,-60,3]) {
        cube([120,120,120]);
        rotate([0,-45,0]) cube([120,120,120]);
    };
    translate([60.5,0,-1])rotate([0,0,135]) cube([10,10,5]);
    translate([43.5,0,1]) cube([20,14,5],center=true);
    
}