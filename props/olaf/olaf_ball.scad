module olaf() {
    scale(2.55) rotate([-90,0,0]) translate([49.,-42,-44])
        import("Olaf_head01.STL", convexity=5);
    translate([5,-88,0]) rotate([90,0,0]) cylinder(h=20, r=27.6, center=true, $fn=100);
    //translate([10,-90,10]) sphere(d=45, $fn=50);
}

module ball() {
    sphere(d=180);
    scale([8,8,8]) translate([-25,-25,-25])
        import("Soccer_Ball_24mm.stl", convexity=5);
}

module nose() {
    translate([0,-37.5,25])
    import("Olaf_nose.STL");
}




/*
module teeth() {
translate([100,0,0]) 
import("files/Olaf_teeth.STL");
}
*/

/*
scale([2,2,2]) intersection() {
    union() {
        olaf();
        //nose();
    }
    translate([0,0,250]) cube(500, center=true);
}
*/

/*difference() {
union() {
    olaf();
    ball();
}
translate([0,-34,-7.5]) cube([30,100,10], center=true);
}*/

//nose();
//teeth();

/*intersection() {
    scale(1.2) olaf();
    //scale(1.2) ball();
    sphere(d=230, $fn=200);
    //sphere(d=198, $fn=200);
    translate([0,0,150]) cube(300, center=true);
}*/

rotate([180,0,0])
difference() {
    scale(1.2) ball();
    translate([0,0,150]) cube(300, center=true);
    #rotate([10,0,0]) {
        translate([0,-105,-33]) cube([90,300,48], center=true);
        translate([0,-105,-57]) scale([1,1,0.5]) rotate([0,45,0]) cube([90/1.414,300,90/1.414], center=true);
    }
}