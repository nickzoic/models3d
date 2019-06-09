$fn=100;

d1 = 20;
d2 = 35;
x = 93;
y = 108;
yo = 15;
z = 15;
t = 3;

xd = 7;
yd1 = 15;
yd2 = 50;

rw = 38.25; // rail width
rv = 2; // rail vertical
rt = 3.5; // rail triangular cut
rh = 10; // rail vertical clearance
rl = 35; // rail length
rx = 5; // rail thickness
rz = 1; // rail edge bevel

module rail() {
    linear_extrude(rl, center=true) {
        polygon(points=[
            [-rw/2-rx,-rx*1.5],   // A
            [-rw/2-rx,rv+rt-rz], // B
            [-rw/2-rx+rz,rv+rt], 
            [-rw/2+rt-rz,rv+rt], // C
            [-rw/2+rt-rz,rv+rt-rz],
            [-rw/2,rv],       // D
            [-rw/2,0],        // E
            [rw/2,0],         // F
            [rw/2,rv],        // G
            [+rw/2-rt+rz,rv+rt-rz],
            [+rw/2-rt+rz,rv+rt], // H
            [+rw/2+rx-rz,rv+rt],
            [+rw/2+rx,rv+rt-rz], // I
            [+rw/2+rx,-rx*1.5]    // J
        ]);
    }
}     

module tripod() {
    //difference() {
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
    
    //translate([-x/2,-y/2,-t*1.75]) cylinder(d=d1*0.4,h=t);
    //translate([+x/2,-y/2,-t*1.75]) cylinder(d=d1*0.4,h=t);
    //translate([0,y/2,-t*1.75]) cylinder(d=d1*0.4,h=t);
//}
}


module rail_mount() {
    intersection() {
        translate([0,yo,z+t]) rotate([90,0,90]) rail();
        linear_extrude(100) {
            polygon(points=[
                [-rl/2,-rw/2-rx+yo],
                [-rl/4,rw/2+rx+yo],
                [rl/4,rw/2+rx+yo],
                [rl/2,-rw/2-rx+yo]
            ]);
        }
 
    }
}

module screw_mount() {
    translate([0,yo,0]) cylinder(d=xd,h=100);
    translate([0,yo,z-yd2+yd1]) cylinder(d1=yd2, d2=yd1, h=yd2-yd1);
}

difference() {
    union() {
        tripod();
        rail_mount();
    }
    screw_mount();
   }
