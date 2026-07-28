difference() {
    hull() {
        cylinder(d=26,h=15,center=true);
        translate([-15,0,0]) cube([34,26,15],center=true);
    }
    cylinder(d=23,h=15,center=true);
    translate([0,0,5]) cylinder(h=6,d=24.25,center=true);
    translate([0,0,-5]) cylinder(h=6,d=24.25,center=true);
    translate([-22,0,0]) cube([12,20,15], center=true);
    for (y=[-7.5,0,7.5]) 
        translate([-20,y,0]) #rotate([0,-90,0]) cylinder(d=4,h=20);
}