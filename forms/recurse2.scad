$fn=20;
limit = 4;

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
        sphere(d=8);
    }
}

fnord(12);
//cylinder(d1=50,d2=50,h=3);
//translate([0,0,3]) cylinder(d1=50,d2=10,h=5);