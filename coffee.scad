$fn=100;

d1 = 82.5;
d2 = 71.5;
hd = 32;

xr = 2.5;
hl = 25;

xo = 45;
yo = 15;

rotate([0,180,0]) {
difference() {
    union() {
        rotate_extrude() hull() {
            translate([d1/2+xr,+hd/2,0]) circle(r=xr);
            translate([d2/2+xr,-hd/2,0]) circle(r=xr);
        };

        
        difference() {
            union() {
                translate([0,d1/4+d2/4+yo+xr,0]) rotate([0,90,0]) cylinder(h=xo,d=hd+xr*2,center=true);        
                translate([0,d1/4+d2/4+5,0]) cube([xo,yo*2,hd+xr*2],center=true);
                translate([-10,d1/4+d2/4+yo,-hd/2-xr-1]) rotate([90,90,0]) cylinder(h=xo/2,d=xo/4,center=true);
                translate([10,d1/4+d2/4+yo,-hd/2-xr-1]) rotate([90,90,0]) cylinder(h=xo/2,d=xo/4,center=true);
    
            }
            cylinder(d1=d2-(d1-d2)/2+xr*2,d2=d1+(d1-d2)/2+xr*2,h=2*hd,center=true);
            translate([0,d1/4+d2/4+yo+xr,-20]) cube([xo+2,2,xo+2],center=true);
            translate([-10,d1/4+d2/4+yo+1,-hd/2-xr-1]) rotate([90,90,0]) cylinder(h=xo/2,d=3,center=true);
                    translate([10,d1/4+d2/4+yo+1,-hd/2-xr-1]) rotate([90,90,0]) cylinder(h=xo/2,d=3,center=true);
    
        }
    }
    translate([0,d1/2+yo,0]) rotate([0,90,0]) cylinder(d=hd,h=100,center=true);
    
    /*rotate([0,90,0]) cylinder(d=20,h=100,center=true);
    rotate([45,90,0]) cylinder(d=20,h=100,center=true);
    rotate([90,90,0]) cylinder(d=20,h=100,center=true);
    rotate([135,90,0]) cylinder(d=20,h=100,center=true);*/
    
}

/*
translate([0,d1/4+d2/4+hd/2,0]) rotate([0,90,0]) difference() {
    cylinder(d=hd+xr*2,h=hl, center=true);
    cylinder(d=hd,h=hl+2, center=true);
}
*/
}