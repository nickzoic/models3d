font = "FreeMono:style=Bold";

module m1() {
    difference() {
        cube([80,70,2]);
        translate([8,62,-1]) cylinder(d=6.5,h=4);
        translate([45,35,-1]) cylinder(d=60,h=4);
    }
}

module seg(n) {
    translate([45,35,0])
    rotate([0,0,n*40])
    rotate_extrude(angle=40)
    polygon([
        [0,0],
        [30,0],
        [30,2],
        [0,2]
    ]);
}

material = 0;
if (material == 0) {
    m1();
    color("red") seg(1);
    color("orange") seg(2);
    color("yellow") seg(3);
    color("green") seg(4);
    color("aqua") seg(5);
    color("blue") seg(6);
    color("purple") seg(7);
    color("violet") seg(8);
    color("magenta") seg(9);
} else if (material <= 10) {
    seg(material-1);
}