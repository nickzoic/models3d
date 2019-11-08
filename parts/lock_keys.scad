// Lock cylinder replacement for a caravan lock/latch set.
//
// Just a pentagonal socket really, it's not exactly secure, but since you can let
// yourself into the van by peeling open some velcro and crawling in, that's not
// really the point.
// print with a very high density 3D infill (75% gyroid worked for me)

kr = 5.125;

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

module key() {
    intersection() {
        hull() {
            translate([0,12,3.425])sphere(d=kr*2);
            translate([0,-12,3.425]) sphere(d=kr*2);
        }
        translate([0,16,3.425]) rotate([90,270,0]) linear_extrude(32) pentagon(kr);
    }
    difference() {
        translate([0,16,2.5]) cylinder(d=20, h=5, center=true);
        translate([0,21,2.5]) cylinder(d=5, h=10, center=true);
    }
}

key();
translate([16,10,0]) rotate([0,0,180]) key();
translate([-16,10,0]) rotate([0,0,180]) key();
