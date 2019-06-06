$fn=100;

d1 = 25;
d2 = 45;
x = 110;
y = 110;
yo = 10;
z = 30;
t = 3;

xd = 6;
yd1 = 20;
yd2 = 50;

rw = 38; // rail width
rv = 2; // rail vertical
rt = 3.5; // rail triangular cut
rh = 10; // rail vertical clearance
rl = 30; // rail length
rx = 5; // rail thickness

module rail() {
    linear_extrude(rl, center=true) {
        polygon(points=[
            [-rw/2-rx,-rx*2],   // A
            [-rw/2-rx,rv+rt], // B
            [-rw/2+rt,rv+rt], // C
            [-rw/2,rv],       // D
            [-rw/2,0],        // E
            [rw/2,0],         // F
            [rw/2,rv],        // G
            [+rw/2-rt,rv+rt], // H
            [+rw/2+rx,rv+rt], // I
            [+rw/2+rx,-rx*2]    // J
        ]);
    }
}     

module tripod() {
    union() {
        hull() {
            translate([-x/2,-y/2,0]) cylinder(d=d1, h=t);
            translate([-x/2,-y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
        }
        hull() {
            translate([+x/2,-y/2,0]) cylinder(d1=d1/2, d2=d1, h=t);
            translate([+x/2,-y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
            
        }    
        hull() {
            translate([0,y/2,0]) cylinder(d1=d1/2, d2=d1, h=t);
            translate([0,y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
        }
    }
}

module rail_mount() {
        translate([0,yo,z+rx]) rotate([90,0,90]) rail();
}

module screw_mount() {
    translate([0,yo,0]) cylinder(d=xd,h=z+t+1);
    translate([0,yo,z-yd2+yd1]) cylinder(d1=yd2, d2=yd1, h=yd2-yd1);
}

/*difference() {
    tripod();
    screw_mount();
}*/

union() {
    tripod();
    rail_mount();
}
    
