a = 50;
p = 0.5;
h = 250;
r = 25;
s = 1;
$fn=60;

w = 25;
t = 1.5;

difference() {
    rotate([0,a,0])
        translate([0,0,-h/2])
            for (y=[0:s:h])
                translate([0,0,y])
                    cylinder(s, pow((h+s-y)/h, p)*r, pow((h-y)/h,p)*r);
          
    translate([0,0,t*1.5])
        cube([w,1000,t],center=true);
    translate([0,0,-500])
        cube(1000, center=true);
}

//translate([50,0,0]) rotate([0,45,0]) cube(200);