// brim diameter
d1 = 25;

// pin diameter
d2 = 7;

// stripe diameter (min)
d3 = 10;

// stripe diameter (max)
d4 = 13;

// brime cone diameter
d5 = 15;

// brim height (at edge)
h1 = 2;

// brim cone height
h2 = 3;

// stripe height
h3 = 5;



$fn=50;

module pin() {
    difference() {
        union() {
            cylinder(d1=d5,d2=d2,h=h1*2);
            cylinder(d=d2,h=h2*2+h3*5);
            translate([0,0,h2*2+h3*5]) sphere(d=d2);
        }
        translate([0,0,h2*2+h3*5]) rotate([0,90,0]) cylinder(d=d2/3,h=d2, center=true);
    }
}

module brim() {
    difference() {
        cylinder(d=d1,h=h1);
        cylinder(d1=d5+0.5,d2=d2+0.5,h=h1*2);
    }
}

module stripe1() {
    difference() {
        cylinder(d1=d4,d2=(d3+d4)/2,h=h3);
        cylinder(d=d2+0.5,h=h3);
        cylinder(d1=d3+0.5,d2=d2+0.5,h=h1*2);
    }
}

module stripe2() {
    difference() {
        cylinder(d1=(d3+d4)/2,d2=d3,h=h3);
        cylinder(d=d2+0.5,h=h3);
    }
}

module stripe3() {
    difference() {
        cylinder(d=d3, h=h3);
        cylinder(d=d2+0.5,h=h3);
    }
}

module stripe4() {
    difference() {
        cylinder(d1=d3,d2=(d3+d4)/2,h=h3);
        cylinder(d=d2+0.5,h=h3);
    }
}

module stripe5() {
    difference() {
        cylinder(d1=(d3+d4)/2,d2=d4,h=h3);
        cylinder(d=d2+0.5,h=h3);
    }
}
        
module assembled_hat() {
    color("red") pin();
    color("white") brim();
    color("red") translate([0,0,h1+0.25]) stripe1();
    color("white") translate([0,0,h1+h3+0.5]) stripe2();
    color("red") translate([0,0,h1+h3*2+0.75]) stripe3();
    color("white") translate([0,0,h1+h3*3+1]) stripe4();
    color("red") translate([0,0,h1+h3*4+1.25]) stripe5();
}

module parts_red() {
    pin();
    translate([(d5+d4+1)/2,0,0]) stripe1();
    translate([d5+d4,0,0]) stripe5();
    translate([d5+d4+d3+2,0]) stripe3();
}

module parts_white() {
    
    translate([0,0,h1]) rotate([0,180,0]) brim();
    translate([(d1+d4)/2,d4/2,0]) stripe2();
    translate([(d1+d4)/2,-d4/2,0]) stripe4();
}
    
parts_red();
translate([0,25,0]) parts_white();
