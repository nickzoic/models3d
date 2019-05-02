$fn=50;

seed=45;
od=8;
num=50;

spikes = [ for (n=[1:num]) rands(-180,180,3,n*seed) ];

module spikey() {   
    intersection() {
        sphere(d=50);
        difference() {
            union() {
                sphere(d=5);
                for (s = spikes) {
                    rotate(s) cylinder(d2=0,d1=od,h=25);
                }
            }
            cube([6,6,6],center=true);
        }
    }
}

translate([0,20,0]) intersection() {
    translate([0,0,25]) cube([50,50,50],center=true);
    spikey();
}
translate([0,-20,0]) rotate([0,180,0]) intersection() {
    translate([0,0,-25]) cube([50,50,50],center=true);
    spikey();
}
translate([15,0,0]) cube([5,5,5]);
translate([15,6,0]) cube([5.5,5.5,5.5]);