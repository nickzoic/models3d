$fn=100;

outer_diameter = 118;
inner_diameter = 90;
wall_thickness = 2;
base_thickness = 3;
inner_bevel = 2;

difference() {
    union() {
        translate([0,0,base_thickness]) difference() {
            sphere(d=outer_diameter);
            sphere(d=outer_diameter-wall_thickness*2);
        };
        difference() {
            cylinder(h=base_thickness+inner_bevel,d=outer_diameter);
            cylinder(h=base_thickness,d=inner_diameter);
            translate([0,0,base_thickness]) cylinder(h=inner_bevel,d1=outer_diameter-wall_thickness*2-inner_bevel*2,d2=outer_diameter-wall_thickness*2);
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
        cylinder(h=3,d=outer_diameter);
        translate([43,-60,-20]) {
            rotate([0,-45,0]) cube([120,120,120]);
        };
    }
    translate([0,0,-1]) cylinder(h=5,d=inner_diameter);
}

// this bit is just for (moral?) support

hull() {
    translate([-30,20,0]) cylinder(d=10,h=0.25);
    translate([-30,-20,0]) cylinder(d=10,h=0.25);
}