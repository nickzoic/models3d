dia = 50;     // corner diameter
fwd = 135;     // projection fwd
rev = 75;       // projection rear
width = 110;   // width at fork
fwdw = 55;     // width at front
revw = 65;     // width at rear
thick = 2;     // max thickness
fork = 48;    // fore-aft distance between holes
center = 16;  // center rib width
holes = 80;   // width between side holes

holesize = 4;

pinheight = 15;
pindia = 14;
pinholeheight=4.5;

$fn = 200;

grooves = 16;
groove_height = thick * 2 / 3;
groove_width = 2 * tan(90/grooves) * groove_height;
groove_space = 1.5;
groove_extra = 0.125;

points = [
        [-width/2, thick/2],
        [-width/2, 0],
        for (g = [0:grooves-1]) each [
            [ center/2 + g * groove_space, 0],
            [ center/2 + g * groove_space + groove_width/2 + groove_extra, groove_height ],
            [ center/2 + g * groove_space + groove_width + groove_extra, 0]
        ],
        for (g = [grooves-1:-1:0]) each [
            [ -center/2 - g * groove_space, 0],
            [ -center/2 - g * groove_space - groove_width/2, groove_height ],
            [ -center/2 - g * groove_space - groove_width/2 - groove_extra, groove_height ],
            [ -center/2 - g * groove_space - groove_width - groove_extra, 0]
        ],
        
        [width/2, 0],
        [width/2, thick/2],
        [center / 2 + grooves * groove_space, thick],
        [-center / 2 - grooves * groove_space, thick],
];


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
        
        // XXX for test printing
        //cube([200,20,100], center=true);
        }
        
    for (x=[-1,0,1]) {
        for (y=[-1,1])
            translate([x*holes/2,y*fork/2,-1])
                cube([holesize,holesize/2,thick*4],center=true);
    }
}

difference() {
    cylinder(h=pinheight+thick, d1=pindia, d2=pindia-2);
    translate([0,0,pinholeheight+thick])
    cube([holesize,pindia,holesize/2], center=true);
   
translate([0,0,pinheight+thick-1]) linear_extrude(2) text("1", size=8,valign="center", halign="center");
}
