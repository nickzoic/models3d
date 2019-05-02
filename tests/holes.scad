$fn=100;

d = 18;
s = 0.5;
x = d * 9 / 16;
h = d * 3 / 4;

x1 = 17;
x2 = 19;
ss = 0.5;

tt = x2*3/4;
nn = (x2-x1)/ss;
oo = x2 * 1.1;

difference() {
    cube([oo*(nn+1)+4, x2*1.5, tt]);
    for(i = [0:1:(x2-x1)/ss]) {
        dd = x1+i*ss;
        translate([oo*(i+0.5)+2, 5*x2/8, -1]) cylinder(d=dd, h=tt+2);
        translate([oo*(i+0.5)+2, 10.5*x2/8, tt-1]) linear_extrude(2) text(text=str(dd), halign="center", valign="center", size=x2/3);
    }
}
    
    
    /*
    cube([d*2.5,d*2.5,h], center=true);
    translate([-x,x,0]) cylinder(d=2,h=6);
    
    rotate([0,0,45]) translate([0,0,h/2-1]) linear_extrude(2) text(text=str(d), halign="center", valign="center", size=d/3);
    translate([-x,x,0]) cylinder(d=d-s,h=h+2, center=true);
    translate([x,x,0]) cylinder(d=d,h=h+2, center=true);
    translate([x,-x,0]) cylinder(d=d+s,h=h+2, center=true);
    translate([-x,-x,0]) cylinder(d=d+2*s,h=h+2, center=true);
    
    rotate([0,0,45]) translate([0,2.6*x,h/2-1]) linear_extrude(2) text(text=str(d-s), halign="center", valign="center", size=d/5);
    rotate([0,0,135]) translate([0,2.6*x,h/2-1]) linear_extrude(2) text(text=str(d+2*s), halign="center", valign="center", size=d/5);
    rotate([0,0,225]) translate([0,2.6*x,h/2-1]) linear_extrude(2) text(text=str(d+s), halign="center", valign="center", size=d/5);
    rotate([0,0,-45]) translate([0,2.6*x,h/2-1]) linear_extrude(2) text(text=str(d), halign="center", valign="center", size=d/5);
    
}*/