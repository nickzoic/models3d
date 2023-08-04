// THE COOL S
// by nick moore
// why?
// i don't know

$fn=64;

x1 = 2;
x2 = 12.5;
y1 = 5;
y2 = 15;
y3 = 25;
z = 4;
z2 = 1.5;

module point() {
    polyhedron([
        [0,y3,0],
        [x2,y2,z],
        [-x2,y2,z],
        [-x2,y2,-z],
        [x2,y2,-z]
      ],[
        [0, 1, 2],
        [0, 2, 3],
        [0, 3, 4],
        [0, 4, 1],
        [1, 4, 3, 2],
    ]);
}

module wedge() {
    polyhedron([
        [-x2,y2,z],
        [-x2,y1,z],
        [-x1,y1,z],
        [-x1,y2,z],
        [-x2,y2,-z],
        [-x2,y1,z2],
        [-x1,y1,z2],
        [-x1,y2,-z]
     ],[
        [0,1,2,3],
        [7,6,5,4],
        [0,4,5,1],
        [2,6,7,3],
        [0,3,7,4],
        [1,5,6,2],
     ]);
}

module cross() {
    polyhedron([
        [-x2,y1,z],
        [-x1,y1,z],
        [x2,-y1,z],
        [x1,-y1,z],
        [-x2,y1,z2],
        [-x1,y1,z2],
        [x2,-y1,z2],
        [x1,-y1,z2]
     ],[
        [0,1,2,3],
        [7,6,5,4],
        [0,4,5,1],
        [2,6,7,3],
        [0,3,7,4],
        [1,5,6,2],
     ]);
}

module the_cool_s() {    
    point();
    rotate([180,0,0]) point();

    wedge();
    rotate([0,180,0]) wedge();
    rotate([180,180,0]) wedge();
    rotate([180,0,0]) wedge();

    cross();
    rotate([180,0,0]) cross();
}

minkowski() {
the_cool_s();
sphere(d=2);
}