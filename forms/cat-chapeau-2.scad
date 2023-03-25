// brim diameter
d1 = 25;

// pin diameter
d2 = 7;

// stripe diameter (min)
d3 = 10;

// stripe diameter (max)
d4 = 14;

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
        union() {
            cylinder(d1=(d3+d4)/2,d2=d4+1,h=h3);
            translate([0,0,h3]) cylinder(d=d4+1,h=1);
        }
        cylinder(d=d2+0.5,h=h3+1);
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
    translate([d5+d4,0,h3])  rotate([0,180,0]) stripe1();
    translate([(d5+d4-1)/2,0,0])stripe5();
    translate([d5+d4+d3+2.5,0]) stripe3();
}

module parts_white() {
    
    translate([0,0,h1]) rotate([0,180,0]) brim();
    translate([(d1+d4)/2,d4/2,0]) stripe2();
    translate([(d1+d4)/2,-d4/2,0]) stripe4();
}
    
/*
// TEST PRINT
parts_red();
translate([0,25,0]) parts_white();
*/

/*
// 30 PINS
for (x = [0:5]) {
    for (y = [0:4]) {
        translate([x*(d5-2),(y+x%2/2)*(d5+0.25),0]) pin();
    }
}
*/


// 21 SETS OF RED STRIPES
for (x = [0:2]) {
    for (y = [0:6]) {
        translate([x*40,y*15,0]) stripe1();
        translate([x*40+13+(14.5*(y%2)),y*15,0]) stripe3();
        translate([x*40+26-(11.5*(y%2)),y*15,0]) stripe5();
    }
}

/*
// 20 SETS OF BRIMS & WHITE STRIPES 
for (x = [0:4]) {
    for (y = [0:3]) {
        translate([x*26,y*26,0]) brim();
        translate([x*26,y*26,0]) stripe2();
        translate([y*26+13,x*26-13,0]) stripe4();
    }
}
*/
