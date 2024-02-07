$fn=100;

// print in translucent PLA.

// go ahead, mess with these and make
// your own weird looking rock.

pp = [
   [0,-20,0],
   [-20,0,0],
   [10,10,0],
   
   [0,40,30],
   [30,0,30],
   [-20,-20,30],
   [30,-25,40],
   
   [0,0,60],
   [-40,0,60],
   [30,30,50],
   
    [0,-50,90],
   [-30,10,90],
   [30,30,80],
   [30,-30,90],
   
   [0,0,120],
];

difference() {
    hull() {
        for (p = pp) {
            translate(p) sphere(10);
        }
    }
    hull() {
        for (p = pp) {
            translate(p) sphere(9);
        }
    }
    translate([-4,-4,0]) cylinder(d=12,h=50,center=true);
}

translate([-22,-22,-10])
difference() {
union(){
cylinder(d=18,h=2);
cylinder(d=11.5,h=4);
}
translate([1.5,0,-1])cylinder(d=2.5,h=6);
translate([-1.5,0,-1])cylinder(d=2.5,h=6);

}