linear_extrude(6) import("brace.dxf");

$fn=100;

difference() {
    linear_extrude(6) {
        polygon([
            [0,-35],
            [0,+30],
            [80,+5],
            [62,-35]
        ]);
        
    }
translate([32,4.5,0]) cylinder(d=3, h=20);
translate([32,4.5-30,0]) cylinder(d=3, h=20);
}
