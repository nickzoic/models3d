//cube([30,20,10]);
difference() {

union() {    
linear_extrude(40, twist=300, $fn=100 ) {
    difference () {
        square([10,10], center=true);
        square([5,5]);
     }
}

cylinder(r1=15, r2=5,h=5);
}
# linear_extrude(40, twist=300, $fn=100) { translate([-2,-2,0]) circle(d=3, $fn=12); }
}