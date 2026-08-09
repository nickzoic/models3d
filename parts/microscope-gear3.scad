// notes from version 1
// * print it thicker, more like 15mm [tick]
// * stepper offset is 8mm not 7mm so gear too loose [tick]
// * sleeve fit & taper is all wrong. [half a tick]
// * motor shaft cutout too thick [tick]
// at least the motor fits nicely.

// notes from version 3
// * the taper on the lens mount is the wrong way up.  
//   Hopefully it'll work anyway. (fixed)
// * not much clearance for motor wires (turned 45)
// * taper could go down 1/2 mm (done)
// * added features for IR stall detection

include <../saturnalia/gears.scad>;

id = 39;
gp = 1;
gt = 50;

translate([110,0,0]) {
    intersection() {
        difference() {
            spur_gear(1, 50, 10, 10, optimized=false);
            cylinder(d1=44,d2=42,h=10);
            cylinder(d1=46,d2=44,h=1);
        }
        union() {
            cylinder(d1=48,d2=70,h=5);
            translate([0,0,5]) cylinder(d1=70,d2=48,h=5);
        }
    }
}


difference() {
    union() {
        cylinder(d=50,h=2);
        translate([0,0,2]) cylinder(d1=44.5,d2=41.5,h=15);
    }
    cylinder(d=39,h=17);
    //cylinder(d1=41,d2=39,h=1);
    //translate([0,0,16]) cylinder(d1=39,d2=41,h=1);
    translate([-1,-25,0]) cube([2,50,17]);
}

translate([55,-10,0])
difference() {
    union() {
        cylinder(d=50,h=2);
        translate([0,0,2]) cylinder(d1=43.5,d2=41.5,h=10);
    }
    cylinder(d=39,h=17);
    //cylinder(d1=41,d2=39,h=1);
    //translate([0,0,11]) cylinder(d1=39,d2=41,h=1);
    translate([-1,-25,0]) cube([2,50,17]);
}

translate([0,55,0]) {
  difference() {
    intersection() {
        union() {
            spur_gear(1, 50, 10, 5.5, optimized=false);
            difference() {
                cylinder(d=20,h=12);
                cylinder(d=15,h=12);
            }
            translate([2.5,0,5]) cube([2,6,10],center=true);
            translate([-2.5,0,5]) cube([2,6,10],center=true);
        }
        union() {
            cylinder(d=20,h=20);
            cylinder(d1=48,d2=70,h=5);
            translate([0,0,5]) cylinder(d1=70,d2=48,h=5);
        }
        
      }
    for (a=[0:60:359]) {
        for(x=[-9:9]) {
            rotate([0,0,a+x]) translate([15,0,9]) cylinder(d=5,h=2);
        }
    }
    translate([10,10,1]) rotate([180,0,0]) linear_extrude(2) text("4");
  }
}


module stepper_cutout() {
   translate([8,0,0]) cylinder(d=28.5,h=19);
   translate([8,0,0]) cylinder(d1=30.5, d2=28.5,h=1);
   translate([8,17.5]) cylinder(d=3.5,h=14);
   translate([8,-17.5]) cylinder(d=3.5,h=14);
   translate([20,0,10]) cube([10,18,20],center=true);
   translate([20,0,2]) cube([14,9,4],center=true); 
   translate([0,0,-1]) cylinder(d1=9,d2=9.5,h=1);
   translate([0,0,-10]) cylinder(d=9,h=10);
}

//stepper_cutout();

translate([55,50,0])
difference() {
    hull() {
        cylinder(d=50,h=15);
        translate([50,0,0]) rotate([0,0,135]) translate([8,0,0]) cylinder(d=45,h=15);
    translate([50,0,0]) rotate([0,0,25]) #translate([0,-15,0]) cylinder(d=10,h=15);
    translate([50,0,0]) rotate([0,0,65]) #translate([0,-15,0]) cylinder(d=10,h=15);
    
    }
    cylinder(d1=42,d2=45,h=15);
    translate([0,0,14]) cylinder(d1=45,d2=47,h=1);
    translate([50,0,0]) rotate([0,0,25]) translate([0,-15,0]) cylinder(d=5.25,h=15);
    translate([50,0,0]) rotate([0,0,65]) translate([0,-15,0]) cylinder(d=5.25,h=15);
    translate([50,0,0]) rotate([0,0,25]) translate([0,-15,0]) cylinder(d=6.25,h=5);
    translate([50,0,0]) rotate([0,0,65]) translate([0,-15,0]) cylinder(d=6.25,h=5);
    
    
    translate([50,0,15]) rotate([180,0,135]) stepper_cutout();
    
    //translate([20,22,0]) cube([5,2,15]);
    translate([23,-18,14]) linear_extrude(2) text("4");
}

