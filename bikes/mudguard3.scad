dia = 50;     // corner diameter
fwd = 135;     // projection fwd
rev = 75;       // projection rear
width = 100;   // width at fork
fwdw = 55;     // width at front
revw = 65;     // width at rear
thick = 2;     // max thickness
fork = 50;    // fore-aft distance between holes
center = 16;  // center rib width
holes = 65;   // width between side holes

holesize = 4;

pinheight = 15;
pindia = 10;
pinhole = 4;

ribs = floor((holes - center) / thick / 3.5);

$fn = 200;


points = [
        [-width/2, thick/2],
        [-width/2, 0],
        for (r = [0:ribs-1]) each [
            [ center/2 + r * thick * 1.5, 0],
            [ center/2 + r * thick * 1.5 + thick/2, thick/2 ],
            [ center/2 + r * thick * 1.5 + thick, 0]
        ],
        for (r = [ribs-1:-1:0]) each [
            [ -center/2 - r * thick * 1.5, 0],
            [ -center/2 - r * thick * 1.5 - thick/2, thick/2 ],
            [ -center/2 - r * thick * 1.5 - thick, 0]
        ],
        
        [width/2, 0],
        [width/2, thick/2],
        [center / 2 + ribs * thick * 1.5, thick],
        [-center / 2 + ribs * thick * -1.5, thick],
];

echo(points);

difference() {
    intersection() {
        hull() {
            for (x=[-1,1]) {
                translate([x*(width/2-dia/2),0,0]) cylinder(d=dia,h=thick);
                translate([x*(fwdw/2-dia/2),fwd-dia/2,0]) cylinder(d=dia,h=thick);
                translate([x*(revw/2-dia/2),-rev+dia/2,0]) cylinder(d=dia,h=thick);
            }
        }
        rotate([90,0,0]) linear_extrude(height=fwd*2, center=true) polygon(points);
        }
        
    for (x=[-1,0,1]) {
        for (y=[-1,1])
            translate([x*holes/2,y*fork/2,-1])
                cube([holesize,holesize,thick*4],center=true);
    }
}

difference() {
    cylinder(h=pinheight+thick, d1=pindia, d2=pindia-2);
    translate([0,0,pinheight-thick])
   rotate([90,0,0]) cylinder(d=pinhole, h=pindia+2, center=true);
   }

