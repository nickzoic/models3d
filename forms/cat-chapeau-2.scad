// brim diameter
d1 = 24.5;

// pin diameter
d2 = 7;

// stripe diameter (min)
d3 = 10;

// stripe diameter (max)
d4 = 13;

// brim cone diameter
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
        union() {
            cylinder(d=d1,h=h1);
            //cylinder(d1=d4+2*h1+2,d2=d4,h=h1+1);
            translate([0,0,h1]) cylinder(h=1,d1=d1,d2=d4);
        }
        cylinder(d1=d5+1,d2=d2+1,h=h1*2);
    }
}

module stripe1() {
    difference() {
        cylinder(d1=d4,d2=(d3+d4)/2,h=h3);
        cylinder(d=d2+0.5,h=h3);
        cylinder(d1=d3+0.5,d2=d2+1,h=h1*2);
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
    color("red") translate([0,0,h1+1.25]) stripe1();
    color("white") translate([0,0,h1+h3+1.5]) stripe2();
    color("red") translate([0,0,h1+h3*2+1.75]) stripe3();
    color("white") translate([0,0,h1+h3*3+2]) stripe4();
    color("red") translate([0,0,h1+h3*4+2.25]) stripe5();
}

module parts_red() {
    pin();
    translate([d5+d4,0,h3])  rotate([0,180,0]) stripe1();
    translate([(d5+d4-1)/2,0,0])stripe5();
    translate([d5+d4+d3+2.5,0]) stripe3();
}

module parts_white() {
    
    brim();
    translate([(d1+d4)/2,d4/2,0]) stripe2();
    translate([(d1+d4)/2,-d4/2,0]) stripe4();
}

//assembled_hat();


/*
// TEST PRINT
parts_red();
translate([0,20,0]) parts_white();
*/

//pin();


// 30 PINS
for (x = [1:6]) {
    for (y = [1:5]) {
        translate([x*(d5-2),(y+x%2/2)*(d5+0.25),0]) pin();
    }
}

/*
// 30 SETS OF RED STRIPES
for (x = [0:2 ]) {
    for (y = [0:9]) {
        
        translate([x*39,y*13,(y%2)*h3]) rotate([0,180*(y%2),0]) stripe1();
        translate([x*39+12.25+(14.5*(y%2)),y*13,0]) stripe3();
        translate([x*39+25-(11.5*(y%2)),y*13,0]) stripe5();
    }
}
*/

/*
// 25 BRIMS 
for (x = [0:4]) {
    if (x%2) {
        for (y = [0:4]) {
            translate([x*23.2,y*24.8,0])brim();
        }
    } else {
        for (y = [0:4]) {
            translate([x*23.2,y*24.8+8.8,0])
            brim();
        }
    }
}
*/

/*
// 60 each of stripe2 and stripe4
for (x = [0:9]) {
    for (y = [0:11]) {
        translate([(x+(y%2/3))*(d3+1),y*(d3+0.5),0]) {
            if ((x+y)%2) {
                stripe2();
            } else {
                stripe4();
            }
        }
    }
}
*/