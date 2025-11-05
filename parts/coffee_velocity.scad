$fn=100;
d1 = 36.4;
d2 = 41;
tt = 1.5;
zz = 4;
hh = 50;

ee = 17;

difference() {
rotate_extrude() {
    polygon([
        for (y= [0:1:hh]) [d2+tt+exp(y/ee),y],
        for (y= [hh:-1:zz]) [d1+exp(y/ee+0.25),y],
        [d2,zz],
        [d2, 0]
        
   ]);
}

cube(200);
}
