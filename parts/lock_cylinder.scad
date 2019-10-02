od1 = 15.7;
od2 = 12.5;
od3 = 10.5;
ll1 = 3.76;
ll2 = 1.5;
ll3 = 9.79+2;
ll4 = 1.35;
ll5 = 2.37;
ll6 = 5.4;

cw1 = 6.35;
cw2 = 3.22;

kr = od2/2-1;

$fn=200;

module regular_polygon(sides, radius)
{
  function dia(r) = sqrt(pow(r*2,2)/2);  //sqrt((r*2^2)/2) if only we had an exponention op
  if(sides<2) square([radius,0]);
  if(sides==3) triangle(radius);
  if(sides==4) square([dia(radius),dia(radius)],center=true);
  if(sides>4) {
    angles=[ for (i = [0:sides-1]) i*(360/sides) ];
    coords=[ for (th=angles) [radius*cos(th), radius*sin(th)] ];
    polygon(coords);
  }
}

module pentagon(radius)
{
  regular_polygon(5,radius);
}

difference() {
    union() {
        cylinder(d=od1, h=ll1);
        translate([0,0,ll1]) cylinder(d1=od1, d2=od2, h=ll2);
        translate([0,0,ll1+ll2]) cylinder(d=od2, h=ll3);
        translate([0,0,ll1+ll2+ll3]) cylinder(d=od3, h=ll4);
        translate([0,0,ll1+ll2+ll3+ll4]) cylinder(d=od2, h=ll5);
        translate([0,0,ll1+ll2+ll3+ll4+ll5])
            intersection() {
                cylinder(d=cw1, h=ll6);
                cube([cw1,cw2,ll6*2], center=true);
            }
    }
    intersection() {
        translate([0,0,-2]) linear_extrude(ll1+ll2+ll3) {
            pentagon(kr);
        }
        #union() {
            cylinder(r=kr, h=ll1+ll2+ll3-kr);
            translate([0,0,ll1+ll2+ll3-kr]) cylinder(r1=kr,r2=0,h=kr);    
        }
    }
    translate([0,0,-1]) cylinder(r=kr, h=3);
    translate([0,0,2]) cylinder(r1=kr, r2=1, h=3);
}

module key() {
    intersection() {
        hull() {
            translate([13,12,3.425])sphere(d=kr*2-2);
            translate([13,-12,3.425]) sphere(d=kr*2-2);
        }
        translate([13,16,3.425]) rotate([90,270,0]) linear_extrude(32) pentagon(kr-1);
    }
    difference() {
        translate([13,16,2.5]) cylinder(d=20, h=5, center=true);
        translate([13,21,2.5]) cylinder(d=5, h=10, center=true);
    }
}

key();
rotate([0,0,180]) key();