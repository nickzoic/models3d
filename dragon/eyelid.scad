$fn=100;

outside = 46;
inside = 43;

hinge = 8;
hinge_id = 2;

cable = 6;
cable_h = 12;
cable_id = 4;

difference() {
    union() {
        intersection() {
           sphere(d = outside);
           translate([0,0,-hinge/2]) cylinder(d=outside, h=43);
           rotate([0,110,0]) cylinder(d=outside, h=outside);
           rotate([0,90,0]) cylinder(d=outside, h=outside);
        }
        translate([outside/2+1,0,-hinge/2]) cylinder(d=cable, h = cable_h/3);
        translate([outside/2+1,0,cable_h*2/3-hinge/2]) cylinder(d=cable, h=cable_h/3);
    }
    sphere(d = inside);
    translate([outside/2+1,0,-3]) cylinder(d=cable_id, h = 100, center=true);
    
    rotate([90,0,0]) cylinder(d=hinge_id, h = outside+2, center=true);


translate([outside/2-1,0])
rotate([90,0,-90])
linear_extrude(3)
    text("3", halign="center", size=5);
    }
    
difference() {
    rotate([90, 0, 0]) cylinder(d=hinge, h = outside+1, center=true);
    sphere(d = inside-2);
    rotate([90,0,0]) cylinder(d=hinge_id, h = outside+2, center=true);
}    