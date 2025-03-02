$fn=100;

function stem_func(y) = (y-66.6)^2/100 + 50;

module outside() {
    rotate_extrude() polygon(concat(
        [ [ 0, 0 ] ],
        [ for (y=[0:110]) [ stem_func(y), y ] ],
        [ [ 0, 80 ] ],
    ));
}

difference() {
    outside();
    translate([0,0,5]) cylinder(d1=60,d2=115,h=110);
    rotate_extrude() {
        translate([55,0,0])
            circle(d=40);
    }
    cylinder(h=10,d=2);
}