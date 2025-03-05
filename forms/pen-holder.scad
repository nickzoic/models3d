$fn=20;
seed = 5;

function stem_func(y) = (y-55)^2/100 + 50;

module outside(offs) {
    rotate_extrude() polygon(concat(
        [ for (y=[0:175]) [ stem_func(y)+offs, y ] ],
        [ for (y=[175:-1:0]) [ stem_func(y)+offs - 2, y ] ],
    ));
}

n_circles = 150;
zs = rands(0,110,n_circles,seed);
as = rands(0,360,n_circles,seed*2);
rs = rands(10,17.5,n_circles,seed*3);
os = rands(0,4,n_circles,seed*4);

for (n = [0:n_circles-1]) {
    intersection() {
        outside(floor(os[n]));
        translate([0,0,zs[n]])
            rotate([0,0,as[n]])
                rotate([90,0,0])
                    cylinder(h=200,r=rs[n]);
    }
}

cylinder(h=2,r1=stem_func(0),r2=stem_func(2));