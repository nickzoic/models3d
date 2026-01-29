$fn=180;


difference() {
    intersection() {
        for(a=[0:5:90]) rotate([0,0,a]) cube([35,35,15],center=true);
        scale([1,1,0.75]) sphere(d=51);
    }
    translate([0,0,7]) cylinder(d1=28,d2=30,h=1,center=true);
    
    translate([0,19,6]) linear_extrude(2) text("NM", size=5, halign="center", valign="center");
    translate([0,-19,6]) linear_extrude(2) text("v2", size=5, halign="center", valign="center");
    difference() {
        cylinder(d=28,h=17,center=true);
        
        for(a=[0:60:359]) {
            rotate([0,0,a]) {
                translate([14,0,-7])
                cube([4,8,2],center=true);
            }
        }
    }
    rotate_extrude() {
        translate([25,0]) circle(d=3);
    }
}