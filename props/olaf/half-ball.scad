difference() {
intersection() {
translate([0,0,250]) cube(500, center=true);
scale(9) union() {
    translate([-25,-25,-25]) import("Soccer_Ball_24mm.stl");
    sphere(d=20);
    }
}
}