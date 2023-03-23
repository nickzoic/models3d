points=[
    [0,0],
    [-1.5,-0.8660254037844386],
    [-1,-1.7320508075688772],
    [1,-1.7320508075688772],
    [1.5,-0.8660254037844386],
    [3,-1.7320508075688772],
    [4.5,-0.8660254037844386],
    [4,0],
    [3,0],
    [3,1.7320508075688772],
    [1.5,2.598076211353316],
    [1,1.7320508075688772],
    [0,1.7320508075688772]
  ];

size = 20;

module cutter() {
    for (n = [0 : len(points)-1]) {
        p1 = points[n] * size;
        p2 = points[(n+1)%len(points)] * size;
        
        hull() {
          translate(p1) cylinder(h=16,d1=1.5,d2=0.4,$fn=16);
          translate(p2) cylinder(h=16,d1=1.5,d2=0.4,$fn=16);
        }
        hull() {
          translate(p1) cylinder(h=2,d1=5,d2=3,$fn=16);
          translate(p2) cylinder(h=2,d1=5,d2=3,$fn=16);
        }        
    }
}

cutter();
translate([-6,75,0]) mirror([1,0,0]) rotate([0,0,-60]) cutter();

/*difference() {
    scale([20,20,20]) einstein();
    offset(-1) scale([20,20,22]) einstein();
}*/