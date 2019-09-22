x = rands(0,1,1,1)[0];

module tree(length) {
    cylinder(d1=6,d2=7,h=length);
    translate([0,0,length]) sphere(d=10);
    for (r=[0:90:360]) {
        rotate([0,0,r]) translate([5,0,length]) rotate([20,0,0]) cylinder(h=2,d=10);
    }
}

for(x = [1:5]) {
    for (y=[1:4]) {
        translate([x*17.5,y*17.5,40-x*3]) rotate([0,180,45]) tree(35-x*3);
    }
}
        