c1 = 0;
d1 = 1;
e1 = 2;
f1 = 3;
g1 = 4;
a1 = 5;
b1 = 6;
c2 = 7;
d2 = 8;
e2 = 9;
f2 = 10;
g2 = 11;
a2 = 12;
b2 = 13;
c3 = 14;

score = [
    [ c1, e1, g1 ],
    [ e1, g1, c2 ],
    [ c2, e2, g2 ],
    [ e2, g2, c3 ],
    [ ],
    [ c1 ],
    [ e1 ],
    [ g1 ],
    [ b1 ],
    [ d2 ],
    [ f2 ],
    [ a2 ],
    [ c3 ],
    [ ],
    [ c1, c2 ],
    [ d1, d2 ],
    [ e1, e2 ],
    [ f1, f2 ],
    [ g1, g2 ],
    [ a1, a2 ],
    [ b1, b2 ],
    [ c1, c2, c3 ],
    [ d1, d2 ],
    [ e1, e2 ],
    [ f1, f2 ],
    [ g1, g2 ],
    [ a1, a2 ],
    [ b1, b2 ],
    [ c2, c3 ],
    [ ],
    [5], [3], [12], [2], [0], [9], [8], [4], [6], [10], [7], [11], [14], [13], [1],
    [9, 1], [10, 0], [6, 8], [8, 11], [7, 13], [4, 5], [2, 9], [14, 10], [0, 3], [13, 14], [3, 7], [5, 12], [11, 6], [1, 4], [12, 2]
];


timing = 2;


difference() {
    cube([10+len(score)*timing, 40, 0.6]);
    translate([-15,0,0]) rotate(20) cube([40,40,2], center=true);
    translate([-15,40,0]) rotate(-20) cube([40,40,2], center=true);
    translate([0,0,0.20]) linear_extrude(2) polygon([[2,20], [11,16], [8,20], [11,24]]);
    
    for (x = [0:len(score)-1]) {
        if (len(score[x]) > 0) {
            for (n = [0:len(score[x])-1]) {
                translate([10+x*timing,6+score[x][n]*2,-1])
                    cylinder(d=1.8  , h=2, $fn=20);
            }
        }
    }
}

