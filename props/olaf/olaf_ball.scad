module olaf() {
        scale(1.15) {
            rotate([-90,0,0]) translate([50,-50,-41]) import("Olaf_head01.STL");
            translate([3.25,-35.5,8.5]) rotate([0,0,-60]) {
            scale([0.45,1,0.95]) sphere(d=22.5,$fn=100);
            rotate([0,-90,0]) cylinder(d=20,h=8.5);
            }
            
        }
}

module ball() {
     intersection() {
        union() {
            sphere(d=90);
            scale([4,4,4]) translate([-25,-25,-25]) import("Soccer_Ball_24mm.stl");
        }
        translate([0,0,-100]) cube(200,center=true);
     }
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

scale([2,2,2]) intersection() {
    union() {
        olaf();
        //nose();
    }
    translate([0,0,250]) cube(500, center=true);
}

/*difference() {
union() {
    olaf();
    ball();
}
translate([0,-34,-7.5]) cube([30,100,10], center=true);
}*/

//nose();
//teeth();