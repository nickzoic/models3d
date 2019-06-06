$fn=100;

d1 = 25;
d2 = 40;
x = 93;
y = 108;
yo = 15;
z = 15;
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
rc = 2; // rail chamfer

module rail() {
    linear_extrude(rl, center=true) {
        polygon(points=[
            [-rw/2-rx,-rx],   // A
            [-rw/2-rx,rv+rt-rc], // B
            [-rw/2-rx+rc,rv+rt],
            [-rw/2+rt,rv+rt], // C
            [-rw/2,rv],       // D
            [-rw/2,0],        // E
            [rw/2,0],         // F
            [rw/2,rv],        // G
            [+rw/2-rt,rv+rt], // H
            [+rw/2+rx-rc,rv+rt],
            [+rw/2+rx,rv+rt-rc], // I
            [+rw/2+rx,-rx]    // J
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
    translate([0,yo+rw/2,z]) cube([rl,rx*2,rx*1.5], center=true);
}

module screw_mount() {
    translate([0,yo,0]) cylinder(d=xd,h=100);
    translate([0,yo,z-yd2+yd1]) cylinder(d1=yd2, d2=yd1, h=yd2-yd1);
}

/*difference() {
    tripod();
    screw_mount();
}*/

difference() {
    union() {
        tripod();
        rail_mount();
    }
    //screw_mount();
}
    
