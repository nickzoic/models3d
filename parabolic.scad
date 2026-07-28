radius = 215;
focal = 160;
size = 70;
$fn=60;

a = 1 / (4 * focal);

curve = concat(
    [ for (x=[0:1:radius]) [x,a*x*x] ],
    [ [radius,-5], [0,-5] ]
);
    
echo(curve);

translate([0,0,focal]) sphere(d=10);
   
difference() {
rotate_extrude($fn=360) polygon(points=curve);


for (x_k0_rr=[
    [0,0,0],
    [64,30,0],
    [110,0,0],
    [128,30,0],
    [165,10.75,0],
    [165,-10.75,0],
    [185,30,0],
    //[250,0,0],
    //[266,16.5,0],
    //[266,-16.5,0],
]) {
    x = x_k0_rr[0];
    k0 = x_k0_rr[1];
    rr = x_k0_rr[2];
    for (k=[0:60:359]) {
        z = a*x*x;
        t = atan2(2*a*x,1);
        rotate([0,0,k+k0]) {
            translate([x,0,z+1])
            rotate([0,-t,0]) rotate([0,0,rr-k0])    
                cylinder(d=size,h=3, $fn=6);
            
        }
    }
}

cube(300);
}