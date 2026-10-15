$fn=100;
d1 = 36.4;
d2 = 41;
tt = 1.5;
zz = 4;
hh = 40;

ee = 14;

difference() {
rotate_extrude() {
    polygon([
        for (y= [0:1:hh]) [d2/2+tt+exp((y-2*zz)/ee),y],
        for (y= [hh:-1:zz]) [d1/2+exp((y-zz)/ee),y],
        [d2/2,zz],
        [d2/2, 0]
        
   ]);
}

//cube(200);
}
