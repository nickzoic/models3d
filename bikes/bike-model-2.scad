// from https://stackoverflow.com/a/63977364

// Transpose of matrix A (swap rows and columns)
function transpose(A) = [for (j = [0:len(A[0])-1]) [for(i = [0:len(A)-1]) A[i][j]]];

//  Cylinder of radius r from P to Q
module cyl_between(P, d1, Q, d2){
    v = Q - P;    // vector from P to Q
    L = norm(v);  // height of the cylnder = dist(P, Q) 
    c = v / L;    // unit vector: direction from P to Q    
    is_c_vertical = ( 1 - abs(c * [0, 0, 1]) < 1e-6); //is c parallel to z axis?
    u = is_c_vertical ? [1, 0, 0] : cross([0, 0, 1], c); // normal to c and Z axis
    a = u / norm(u); // unit vector normal to c and the Z axis
    b = cross(c, a); // unit vector normal to a and b
    // [a, b, c] is an orthonormal basis, i.e. the rotation matrix; P is the translation
    MT = [a, b, c, P]; // the transformation matrix
    M = transpose(MT); // OpenSCAD wants vectors in columns, so we need to transpose
    multmatrix(M)
        cylinder(h=L, d1=d1, d2=d2, $fn=30);
}

front_wheel_diameter = 900;
rear_wheel_diameter = 700;
front_wheel_width = 50;
rear_wheel_width = 150;
wheelbase = 1400;
seat_tube_angle = 70;
seat_tube_up = 500;
top_tube_up = 450;
seat_stays_up = 300;
seat_tube_down = 300;
fork_angle = 71;
fork_offset = 50;
fork_top_diameter = 100;
steer_length = 150;
stem_height = 100;
stem_length = 100;
num_spokes = 32;
steer_tube_diameter = 80;
seat_tube_diameter = 50;
extra_seat_tube_space = 20;


rear_axle_height = (rear_wheel_diameter+rear_wheel_width)/2;
front_axle_height = (front_wheel_diameter+front_wheel_width)/2;
seat_tube_clearance = (rear_wheel_diameter+rear_wheel_width+seat_tube_diameter)/2+extra_seat_tube_space;
offset_stays = rear_wheel_width/2+15;
offset_forks = front_wheel_width/2+15;
fork_width = front_wheel_width + 50;
dropout_width = rear_wheel_width + 50;

module rear_wheel() {
    translate([0,rear_axle_height,0]) {
        
        rotate_extrude() translate([rear_wheel_diameter/2,0,0]) circle(d=rear_wheel_width);
        cylinder(h=dropout_width,d=20,center=true);
    }
    for (n = [0:num_spokes]) {
        translate([0,rear_axle_height,(n%2)*20-10])
        rotate([90,0,n*360/num_spokes]) cylinder(h= rear_wheel_diameter/2,d=2);
    }

}

module rear_wheel_clearance() {
    hull() {
        translate([0,rear_axle_height,0]) {
        rotate_extrude() translate([rear_wheel_diameter/2,0,0]) circle(d=rear_wheel_width+20);
        }
    }
}

// front wheel
module front_wheel() {
    translate([wheelbase,front_axle_height,0]) {
        rotate_extrude() translate([front_wheel_diameter/2,0,0]) circle(d=front_wheel_width);
        cylinder(h=fork_width,d=20,center=true);
    }
    for (n = [0:num_spokes]) {
        translate([wheelbase,front_axle_height,(n%2)*20-10])
        rotate([90,0,n*360/num_spokes]) cylinder(h=front_wheel_diameter/2,d=2);
    }

}

module front_wheel_clearance() {
    hull() {
        translate([wheelbase,front_axle_height,0]) {
        rotate_extrude() translate([front_wheel_diameter/2,0,0]) circle(d=front_wheel_width+20);
        }
    }
}
        
// seat post
module seat_tube() {
    translate([0, rear_axle_height, 0])
    rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) rotate([-90,0,0]) translate([0,0,(seat_tube_up-seat_tube_down)/2]) cylinder(h=seat_tube_up+seat_tube_down,d=seat_tube_diameter,center=true);
}

module bb() {
    translate([0, rear_axle_height, 0])
    rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,-seat_tube_down,0]) cylinder(h=rear_wheel_width+20,d=50, center=true);
}

module seat_stays() {
    seat_stay_angle = 60;
    difference() {
        union() {
            hull() {
               translate([0, rear_axle_height, 0]) rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,seat_stays_up,0]) sphere(d=seat_tube_diameter);
                translate([0, rear_axle_height, 0]) rotate([0,0,seat_stay_angle]) translate([rear_wheel_diameter/2+rear_wheel_width/2,0,0]) rotate([0,90,0]) cylinder(d=50,h=25);
            }
            hull() { 
                translate([0,rear_axle_height,0]) cylinder(d=20,h=dropout_width,center=true);
                translate([0,rear_axle_height,0]) rotate([90,0,seat_stay_angle]) translate([rear_wheel_diameter/2,0,0]) cylinder(h=50,d=dropout_width,center=true);    
                
            }   
        }
        rear_wheel_clearance();
    }
}

module chain_stays() {
    chain_stay_angle = -18;
    difference() {
        union() {
            hull() {
               translate([0, rear_axle_height, 0]) rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,-seat_tube_down,0]) sphere(d=seat_tube_diameter);
                translate([0, rear_axle_height, 0]) rotate([0,0,chain_stay_angle]) translate([rear_wheel_diameter/2+rear_wheel_width/2,0,0]) rotate([0,90,0]) cylinder(d=50,h=25);
            }
            hull() { 
                translate([0,rear_axle_height,0]) cylinder(d=20,h=dropout_width,center=true);
                translate([0,rear_axle_height,0]) rotate([90,0,chain_stay_angle]) translate([rear_wheel_diameter/2,0,0]) cylinder(h=50,d=dropout_width,center=true);    
                
            }   
        }
        rear_wheel_clearance();
    }
}
    
module xchain_stays() {
    for (zz = [-1,1]) {
        // chain stays
        hull() {
            translate([0,rear_axle_height,zz*offset_stays])
            cylinder(d=30,h=10,center=true);
            translate([0, rear_axle_height, 0])
    rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,-seat_tube_down,zz*offset_stays]) cylinder(h=10,d=50, center=true);
        }
    }
}

module forks() {
    difference() {
        
        translate([wheelbase,front_axle_height,0]) hull() {
            cylinder(d=30,h=front_wheel_width*1.5,center=true);
            rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2,0,0]) translate([0, fork_offset,0]) sphere(d=fork_width);
            
        }
        front_wheel_clearance();
    }
}

module top_tube() {
    hull() {
        translate([0, rear_axle_height, 0])
    rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,top_tube_up,0]) sphere(d=seat_tube_diameter);
        
    translate([wheelbase,front_axle_height,0])
    rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([steer_length+100, fork_offset, 0]) sphere(d=steer_tube_diameter);
    }
}

module steer_tube() {
    hull() {
        translate([wheelbase,front_axle_height,0])
    rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([steer_length+100, fork_offset, 0]) sphere(d=steer_tube_diameter);
    translate([wheelbase,front_axle_height,0])
    rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([100, fork_offset, 0]) sphere(d=steer_tube_diameter);
    }
}

module down_tube() {
hull() {
translate([wheelbase,front_axle_height,0])
rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([100, fork_offset, 0]) sphere(d=steer_tube_diameter);
translate([0, rear_axle_height, 0])
rotate([0,0,90-seat_tube_angle]) translate([seat_tube_clearance,0,0]) translate([0,-seat_tube_down,0]) sphere(d=seat_tube_diameter);
}
}
    
module stem() {
hull() {
translate([wheelbase,front_axle_height,0])
rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([steer_length+stem_height+100, fork_offset,0]) sphere(d=30);
    translate([wheelbase,front_axle_height,0])
rotate([0,0,180-fork_angle]) translate([front_wheel_diameter/2+front_wheel_width*1.5,0,0]) translate([0, fork_offset,0]) sphere(d=30);
}
}

color("green") {
    front_wheel();
    rear_wheel();
}
color("yellow") {
    forks();
    stem();
}
color("red") {
top_tube();
down_tube();
steer_tube();
seat_tube();
    seat_stays();
    chain_stays();
bb();
}
