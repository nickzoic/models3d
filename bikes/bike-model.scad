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

// typical bike: Giant Cross City 1 Disc 2021 Size L
// https://geometrygeeks.bike/bike/giant-cross-city-1-disc-2021/

reach = 416;
stack = 585;
top_tube_eff = 595;
seat_tube_c_t = 535;
head_angle = 71;
seat_angle = 73;
head_tube = 160;
chainstay = 445;
wheelbase = 1091;
standover = 799;
bb_drop = 60;
fork_rake = 50;
trail = 69.4;
wheel = 700;
stem_length = 100;
crank_length = 175;

// other

bb_width = 100;
seat_diameter = 32;
dropout = 5;
rear_axle_length = 150;
front_axle_length = 150;

// derived: crank is at (0,0,)

seat_tube_c_c = seat_tube_c_t - 30;

rear_axle_x = -sqrt(
   chainstay ^ 2 - bb_drop ^ 2
);
front_axle_x = wheelbase + rear_axle_x;

translate([rear_axle_x, 0, bb_drop]) rotate([90,0,0]) cylinder(h=rear_axle_length, d=10, center=true);

translate([front_axle_x, 0, bb_drop]) rotate([90,0,0]) cylinder(h=front_axle_length, d=10, center=true);

rotate([90,0,0]) {
    cylinder(h=bb_width, d=50, center=true);
}

rotate([90,0,0]) {
    hull() {
        translate([0,0,bb_width/2]) cylinder(h=10,d=50);
        translate([rear_axle_x,bb_drop,rear_axle_length/2]) cylinder(h=10, d=30);
    }
    hull() {
        translate([0,0,-bb_width/2]) cylinder(h=10,d=50);
        translate([rear_axle_x,bb_drop,-rear_axle_length/2]) cylinder(h=10, d=30);
    }
};

rotate([0,seat_angle-90,0]) cylinder(h=seat_tube_c_t, d=seat_diameter);
translate([-seat_tube_c_c * cos(seat_angle), 0, seat_tube_c_c * sin(seat_angle)]) rotate([90,0,0]) cylinder(d=seat_diameter,h=seat_diameter, center=true);

hull() {
    translate([-seat_tube_c_c * cos(seat_angle), 20, seat_tube_c_c * sin(seat_angle)]) rotate([90,0,0]) cylinder(d=seat_diameter,h=5, center=true);
        translate([rear_axle_x,rear_axle_length/2,bb_drop]) cylinder(h=10, d=30, center=true);
}
        
hull() {
    translate([-seat_tube_c_c * cos(seat_angle), -20, seat_tube_c_c * sin(seat_angle)]) rotate([90,0,0]) cylinder(d=seat_diameter,h=5, center=true);
        translate([rear_axle_x,-rear_axle_length/2,bb_drop]) cylinder(h=10, d=30,center=true);
}

translate([reach,0,stack]) rotate([0,90+head_angle,0]) translate([0,0,0]) {
    cylinder(h=head_tube,d=50); 
}

hull() {
    translate([reach,0,stack]) rotate([0,90+head_angle,0]) translate([0,0,50]) sphere(d=50);
    translate([-seat_tube_c_c * cos(seat_angle), 20, seat_tube_c_c * sin(seat_angle)]) sphere(d=50);
}
    
hull() {
    translate([reach,0,stack]) rotate([0,90+head_angle,0]) translate([0,0,head_tube-50]) sphere(d=50);
    sphere(d=50);
}

translate([front_axle_x,0,bb_drop])
rotate([90,0,0]) 
rotate_extrude() {
    translate([wheel/2,0,0]) circle(d=50);
};
    
translate([rear_axle_x,0,bb_drop])
rotate([90,0,0]) 
rotate_extrude() {
    translate([wheel/2,0,0]) circle(d=50);
}
