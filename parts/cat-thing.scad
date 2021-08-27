// cat thingy repair

module insert(h) {
    difference() {
        union() {
            for (a = [0:360/9:359]) {
                rotate([0,0,a]) {
                    hull() {
                        translate([21.25,0,0]) rotate([0,0,45]) cube([2,2,h],center=true);
                        cylinder(h=h,d=6,center=true);
                    }
                }
                   
            }
            cylinder(h=h,d=35,center=true);
        }
        cylinder(h=h+2,d=10,center=true);
    }
}

module base(d1,d2,t) {
    translate([0,0,t+10]) insert(20);
    difference() {
        cylinder(h=t,d1=d1,d2=d2);
        cylinder(h=t,d=10);
        for (a=[0:360/27:359]) {
            rotate([0,0,a+180]) {
                translate([23,0,0.6])
                cylinder(h=t-1.2,r=0.2,$fn=16);
            }
        }
    }
}


module cap() {
    $fn=64;
    difference() {
        union() {
            translate([0,0,7.5]) insert(15);
            translate([0,0,15]) cylinder(h=4, d=57);
            intersection() {
                translate([0,0,34]) sphere(d=65);
                translate([0,0,19]) cylinder(h=100,d=65);
            }
        }
        cylinder(d=10,h=100);
        translate([0,0,19]) cylinder(d=27,h=100);
        translate([0,0,33.5]) cylinder(d=32,h=100);
         //translate([0,0,d/2-8]) cylinder(h=11,d=19.5,$fn=6);
         //cylinder(h=d,d=10);
    }
 }
 
 module joiner() {
     difference() {
         union() {
            translate([0,0,7.5]) insert(15);
            translate([0,0,23.5]) insert(15);
            translate([0,0,15.5]) cylinder(h=1.2,d=52,center=true);
         }
         translate([0,0,10]) cylinder(h=30,d=30);
         
     }
 }
 
 module plug() {
     difference() {
         intersection() {
             cylinder(d=31,h=100);
             sphere(d=65);
             //cube([100,100,100]);
         }
         cylinder(d=27, h=16);
         #translate([0,0,16]) cylinder(d1=27,d2=1,h=15);
         
     }
 }
 
 //translate([-25,0,0]) cap(57);
//translate([25,-30,0]) base(57);
//translate([25,30,0])
 
 //base(57,57,2)
 //base(85,81,4);
//joiner();
cap();
 translate([0,50,0]) plug();