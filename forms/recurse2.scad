$fn=20;
limit = 12;

module fnord(x) {
    cylinder(h=x*2,d1=x,d2=x-1);
    if(x>limit) {
        translate([0,0,2*x]) {
            rotate([30,0,0]) fnord(x-1);
            rotate([0,46.5,75]) fnord(x-1);
        }
    }
    if (x==limit) {
        translate([0,0,2*x])
        sphere(d=x*1.5);
    }
}

fnord(20);
translate([0,0,-33]) cylinder(d1=150,d2=150,h=10);
translate([0,0,-23]) cylinder(d1=150,d2=50,h=10);
translate([0,0,-13]) cylinder(d1=50,d2=20,h=13);

