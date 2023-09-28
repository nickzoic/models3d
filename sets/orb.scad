// Coronation Orb, for Frozen The Musical.
// By Nick.

// i started making this parametric but it isn't, really.
$fn=50;
d1=100;
d2=26;

module body() {
    sphere(d=d1, $fn=250);
}

module bands() {
    // circumferential band
    rotate_extrude($fn=100) translate([d1/2-1,0,0]) circle(d=5);

    // double vertical band
    for (x=[-1,1]) {
        translate([x*10,0,0]) rotate([0,90,0]) rotate_extrude($fn=100) translate([d1/2-2,0,0]) circle(d=5);
    }
    
    // circles around rhinestones
    for (a=[0:3]) rotate([0,0,a*90]) translate([d1/2-2,0,0]) rotate([0,90,0]) rotate_extrude() translate([d2/2+1.5,0,0]) circle(d=5);
}

module star() {
    a=7; b=2; c=1; d=4; e=10;
    minkowski() {
    sphere(d=1, $fn=32);
    linear_extrude(1)
    polygon([
        [a,0],[b,c],[d,d],[c,b],
        [0,e],[-c,b],[-d,d],[-b,c],
        [-a,0],[-b,-c],[-d,-d],[-c,-b],
        [0,-e],[c,-b],[d,-d],[b,-c],
    ]);
    }
}

module stars() {

    // assorted stars
    stars = [
        [45,50,0.7],
        [20,45,0.8],
        [42,0,1],
        [40,-30,0.8],
        [15,-40,0.7],
        [30,-50,0.8],
    ];

    for (j = [0,180]) for (k = [0,180]) for (x = stars) {
        rotate([j,0,0]) rotate([0,x[0],x[1]+k]) translate([d1/2-1,0,0]) rotate([90,0,90]) scale(x[2]) star();
    }
}

module cutouts() {
    // cutouts for 1" rhinestones
    for (a=[0:3]) rotate([0,0,a*90])   translate([d1/2-2,0,0]) rotate([0,90,0]) cylinder(d=d2,h=10);
}

module base() {
// cutout on base so it can get enough adhesion to print
translate([0,0,-d1/2-5]) cylinder(d=d1,h=10);
}

module beads() {
    // beads around the top
    for (a=[0:19]) rotate([0,0,a*360/20]) translate([0,d1/4.5,d1/2-2]) sphere(d=10);

    translate([0,0,d1/2-3.5]) cylinder(r=d1/4.5,h=10, center=true);
}

function stem_func(y) = y^2 * 16 + 5;

module stem() {
    translate([0,0,d1/2+1.5]) rotate_extrude() polygon(concat(
        [ [ 0, 0 ] ],
        [ for (y=[0:29]) [ stem_func(y/16-1), y ] ],
        [ [ 0, 27 ] ],
    ));
}

module flower() {
// okay so it's not quite the flowing organic design of the original but meh openscad.
    translate([0,0,d1/2+50]) intersection() {
    
        union() {
            for (a=[0:4]) rotate([0,45,a*72]) rotate([0,0,-25]) rotate_extrude(angle=50) polygon([
                [0,-30],
                [40,-30],
                [40,30],
                [0,30]
            ]);
        }
        difference() {
            sphere(d=50, $fn=100);
            translate([0,0,2]) sphere(d=46, $fn=100);
        }
    }
}

module stem_hole() {
// this hole runs from the bottom of the sphere up through the stem to just below the flower, which forces the slicer to build a tube all the way through.
// this reinforces the stem and also means if broken it should be a lot easier to fix with glue and/or a 4mm dowel.
    translate([0,0,3-d1/2]) cylinder(d=4.5,h=25+d1);
}

module orb() {
    difference() {
        union() {
            body();
            bands();
            stars();
            beads();
            stem();
            flower();
        }
        cutouts();
        base();
        #stem_hole();
    }
}

orb();