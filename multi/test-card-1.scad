font = "FreeMono:style=Bold";

module m1() {
    difference() {
        cube([80,70,2]);
        translate([8,62,-1]) cylinder(d=6.5,h=4);
    }
    translate([0,30,0])
    linear_extrude(3) text("1", font=font, size=25);
}

module m2() {
    translate([20,30,0])
    linear_extrude(3) text("2", font=font,size=25);
}

module m3() {
    translate([40,30,0])
    linear_extrude(3) text("3", font=font,size=25);
}

module m4() {
    translate([60,30,0])
    linear_extrude(3) text("4", font=font,size=25);
}

module m5() {
    translate([0,5,0])
    linear_extrude(3) text("5", font=font,size=25);
}

module m6() {
    translate([20,5,0])
    linear_extrude(3) text("6", font=font,size=25);
}

module m7() {
    translate([40,5,0])
    linear_extrude(3) text("7", font=font,size=25);
}

module m8() {
    translate([60,5,0])
    linear_extrude(3) text("8", font=font,size=25);
}

material = 0;
if (material == 0) {
    color("red") m1();
    color("orange") m2();
    color("yellow") m3();
    color("green") m4();
    color("aqua") m5();
    color("blue") m6();
    color("purple") m7();
    color("violet") m8();
} else if (material == 1) {
    difference() {
        m1();
        m2();
        m3();
        m4();
        m5();
        m6();
        m7();
        m8();
    }
} else if (material == 2) { 
    m2();
} else if (material == 3) { 
    m3();
} else if (material == 4) { 
    m4();
} else if (material == 5) { 
    m5();
} else if (material == 6) { 
    m6();
} else if (material == 7) { 
    m7();
} else if (material == 8) { 
    m8();
}