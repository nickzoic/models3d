module rotate_extrude_twist(trans, twist) {
    for (a = [0:1:360]) {
        hull() {
            rotate([0,0,a]) {
                translate([trans,0,0])
                rotate([90,a*twist,0])
                linear_extrude(0.00001)
                children();
            }
            rotate([0,0,a+1]) {
                translate([trans,0,0])
                rotate([90,(a+1)*twist,0])
                linear_extrude(0.00001)
                children();
            }
        }
    }
}

scale([1,1,2])
rotate_extrude_twist(50, 1.25) {
    circle(d=10,$fn=8);
    //square([10,10],center=true);
}