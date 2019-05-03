$fn=100;
difference() {
    sphere(d=51);
    for (x = [-20,-10,0,10,20]) {
        for (y = [-20,-10,0,10,20]) {
            translate([x,y,0]) cylinder(d=8, h=100, center=true);
        }
    }
    rotate([90,0,0]) cylinder(d=8,h=100,center=true);
    rotate([0,90,0]) cylinder(d=8,h=100,center=true);
}