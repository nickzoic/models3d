x = rands(0,1,1,1)[0];

module tree() {
    cylinder(d1=6,d2=7,h=35);
    translate([0,0,35]) sphere(d=10);
    for (r=[0:90:360]) {
        rotate([0,0,r]) translate([5,0,35]) rotate([20,0,0]) cylinder(h=2,d=10);
    }
}

difference() {
    intersection() {
        sphere(d=100);
        translate([0,0,25]) cube([100,100,50],center=true);
    }

    translate([0,0,40]) cylinder(d1=7,d2=8,h=21,center=true);
    for (y=[20:20:60]) {
        for (x=[0:360/y*4:360]) {
            rotate([0,y,x]) translate([0,0,40]) cylinder(d1=7,d2=8,h=21,center=true);
           
        }
    }
    translate([0,0,1]) rotate([0,180,0]) linear_extrude(2) text("Amelia 2019",halign="center",valign="center");
}

for(x = [0:20:60]) {
    translate([x-30,60,40]) rotate([0,180,30]) tree();
}

for(x = [-42,+42]) {
    for (y=[-42,+42]) {
        translate([x,y,40]) rotate([0,180,0]) tree();
    }
}
        