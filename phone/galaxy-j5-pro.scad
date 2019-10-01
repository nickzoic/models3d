$fn=64;

width = 71; 
length = 146;
height = 8.0;
radius = 5;  // check

thick = 1.5;   // case thickness 
border = 10;
bumper = 2.5;

w = width - 2 * radius - height;
l = length - 2 * radius - height;
    
module phone() {
    hull() {
        for (x = [-w/2,+w/2]) {
            for (y = [-l/2,+l/2]) {
                translate([x,y,0]) {
                    minkowski() {
                        sphere(d=height);
                        cylinder(r=radius,h=0.000000001);
                    }
                }
            }
        }
    }
}

module cutout() {
    hull() {
        for (x = [-w/2,+w/2]) {
            for (y = [-l/2,+l/2]) {
                translate([x,y,height/2-1]) {
                    cylinder(r=radius,h=thick+bumper+2);
                }
            }
        }
    }
}

module split() {
    difference() {
        union() {
            translate([0,length/4+thick/2,0]) cube([width+thick*2,length/2+thick,100], center=true);
            translate([15,-5,0]) cylinder(r=10,h=height+thick*2,center=true);
        }
        translate([-15,5,0]) cylinder(r=10,h=height+thick*2,center=true);
    }
        
}
    
module bumpers() {
    for (x = [-w/2,+w/2]) {
        for (y = [-l/2,+l/2]) {
            translate([x,y,bumper/2]) {
                minkowski() {
                    sphere(d=height+bumper);
                    cylinder(r=radius,h=0.000000001);
                }

            }
        }
    }
}    
        
module case() {
    difference() {
        union() {
            minkowski() {
                sphere(r=thick);
                phone();
            }
            bumpers();
        }
        
        phone();
        cutout();
    }
}

//translate([0,0,0]) cube([width,length,height], center=true);

intersection() {
    case();
    split();
}

translate([0,-30,0]) {
        difference() {
            case();
            split();
        }
}
