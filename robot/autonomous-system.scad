$fn=64;

module asys() {
    difference() {
        circle(r=50);
        for (a = [0:27.7:359]) rotate([0,0,a]) translate([0, 50, 0]) circle(r=6);
        difference() {
            circle(r=35);
            for (a=[110.8,249.2,41.5,318.5,166.2,180.0,193.8]) {
                rotate([0,0,a]) {
                    polygon(points=[
                        [-2,12.5],[-7,43.75],[7,43.75],[2,12.5]
                    ]);
                }
            }
            difference() {
                circle(r=23);
                circle(r=6);
                polygon(points=[
                    [-3,4],[3,4],[3,8],[-3,8]
                ]);
             
            }
        }
        translate([0,-29,0]) circle(r=4);
        for (a=[0,83.1,138.5,221.5,276.9]) {
            rotate([0,0,a]) {
                polygon(points=[
                    [-2,25], [-2,56.25], [2,56.25], [2,25]
                ]);
            }
        }
            
    }
}

difference() {
    linear_extrude(10,twist=0) asys();
    /*union() {
        translate([0,0,1]) linear_extrude(10) offset(-3) asys();
        translate([0,0,2]) linear_extrude(9) offset(-2) asys();
        translate([0,0,3]) linear_extrude(8) offset(-1) asys();
    }*/
    minkowski() {
        translate([0,0,1]) linear_extrude(10) offset(-3) asys();
        cylinder(h=2,r1=0,r2=2, $fn=16);
    }
}