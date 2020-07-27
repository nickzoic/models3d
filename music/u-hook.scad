w = 72;
l = 70;
x = 15;

$fn=40;

difference() {
    union() {
        translate([-x/2,0,0]) cylinder(d=w, h=x, center=true);
        translate([x/2,0,0]) cylinder(d=w, h=x, center=true);
    }
    //translate([x-w/2,0,0]) cylinder(d=3,h=x+2,center=true);
    
    translate([w/2-x/2,0,0]) cylinder(d=5,h=x+2,center=true);
    translate([x/2-w/2,0,0]) cylinder(d=5,h=x+2,center=true);
    translate([w/2-x/2,0,x/2-1.5]) cylinder(d1=5,d2=10,h=3,center=true);
    translate([x/2-w/2,0,x/2-1.5]) cylinder(d1=5,d2=10,h=3,center=true);
}

difference() {
    intersection() {
        translate([0,0,x/2]) cube([x*4,w,x*4],center=true);
        union() {
            translate([-x/2,0,x]) cylinder(d=w, h=x*2, center=true);
            translate([x/2,0,x]) cylinder(d=w, h=x*2, center=true);
        }        
    }
    translate([x*2,0,x*2]) rotate([90,0,0]) cylinder(h=w+2,d=3*x,center=true);
    translate([-x*2,0,x*2]) rotate([90,0,0]) cylinder(h=w+2,d=3*x,center=true);
    translate([w/2-x/2,0,x/2-1]) cylinder(d=10,h=x*2,center=true);
    translate([x/2-w/2,0,x/2-1]) cylinder(d=10,h=x*2,center=true);
}

difference() {
    translate([0,0,l/2]) cube([x,w,l+x], center=true);    
    translate([0,0,l-10]) rotate([0,90,0]) cylinder(d=w-x-x,h=x+2,center=true);
    translate([0,0,l-10+w/2]) cube([x+2,w-x-x,w],center=true);
}

difference() {
    intersection() {
        translate([x/2,0,l+x/2]) rotate([90,0,0]) cylinder(d=2*x,h=w,center=true);
        translate([0,0,l+x/2]) rotate([0,60,0]) cube([x*2,w,x*4],center=true);
    }
    
    translate([0,0,l+x]) cube([x*3,w-x-x,x*3],center=true);
}