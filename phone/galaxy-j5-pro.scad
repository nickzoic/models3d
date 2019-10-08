$fn=64;

width = 71; 
length = 146;
height = 8.0;

radius = 5;  // check

zoffs = 1;

thick = 2.5;   // case thickness 
border = 10;
bumper = 2.5;

w = width - 2 * radius;
l = length - 2 * radius;
    
module phone() {
    hull() {
        for (x = [-w/2,+w/2]) {
            for (y = [-l/2,+l/2]) {
                translate([x,y,0]) {
                    intersection() {
                        scale([2*radius/(height+zoffs),2*radius/(height+zoffs),1]) sphere(d=height+zoffs);
                        translate([0,0,-zoffs]) cube([2*radius,2*radius,height],center=true);
                    }
                }
            }
        }
    }
}

module cutout() {
    hull() {
        for (x = [-w/2+bumper,+w/2-bumper]) {
            for (y = [-l/2+bumper,+l/2-bumper]) {
                translate([x,y,height/2-2]) {
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
            //bumpers();
        }
        
        phone();
        cutout();
    }
}

//translate([0,0,0]) cube([width,length,height], center=true);

/*intersection() {
    case();
    split();
}

translate([0,-30,0]) {
        difference() {
            case();
            split();
        }
}*/

intersection() {
    case();
    cube([200,5,200],center=true);
}
