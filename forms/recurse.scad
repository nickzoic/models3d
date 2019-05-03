$fn=20;

module fnord(x) {
    cylinder(h=x*2,d1=x,d2=x-1);
    if(x>1) {
        translate([0,0,2*x]) {
            rotate([30,0,0]) fnord(x-1);
            rotate([0,45,90]) fnord(x-1);
        }
    }
}

fnord(10);
cylinder(d1=50,d2=50,h=2);
cylinder(d1=50,d2=10,h=5);