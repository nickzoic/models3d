$fn=100;

ww = 63;
wh = 111;
cd = 120;
ch = 200;

xr = 10;

module outer() {
difference() {
        cylinder(d=cd+10,h=20);
            cylinder(d=cd-10, h=ch);
    
}
difference() {
        translate([0,0,ch]) cylinder(d=cd+10,h=20);
        cylinder(d=20,h=ch+20);
        }

for (z=[10,ch+10]) 
    for (a=[0:20:359])
        translate([0,0,z]) rotate([0,0,a]) translate([cd/2+5,0,0]) sphere(d=10,$fn=16);
        
difference() {
        cylinder(d=cd, h=ch);
    cylinder(d=cd-10, h=ch);
    translate([0,-cd*3/4,ch/2]) cube([cd,cd,ch],center=true);
    
    hull() {
        for(x=[-ww/2+xr,+ww/2-xr])
            for (z=[-wh/2+xr,+wh/2-xr])
                translate([x,0,z+ch-wh/2-20])
                    rotate([-90,0,0]) cylinder(r=xr,h=cd);
            
    }
    }
    }
    
    
module inner() {    
cylinder(d=cd-15,h=20);
intersection() {
    union() {
    translate([0,cd*1/4+5,(ch-10)/2]) cube([ww*1.5,10,ch],center=true);
    translate([0,cd*1/4+10,(ch-10)/2+30]) cube([ww,5,wh],center=true);
    
    translate([0,cd*1/4,0])
 rotate([45,0,0])    
    difference() {   
    cube([ww*1.5,cd,cd],center=true);
    cube([ww*1.25,cd+2,cd+2],center=true);
    }
 }   
    
    cylinder(d=cd-15,h=ch);
    }
    }
    
module figure() {
translate([0,0,140]) sphere(d=40);
scale([1.2,1,1]) cylinder(d1=50,d2=10,h=150);
hull() {
translate([20,0,105]) sphere(d=20);
translate([-20,0,105]) sphere(d=20);
translate([10,10,70]) sphere(d=20);
translate([-10,10,70]) sphere(d=20);

}
}

inner();
translate([cd+10,0,ch+20]) 
rotate([0,180,0])
outer();
translate([60,70,0]) figure();