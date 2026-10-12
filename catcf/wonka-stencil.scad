width = 200;
height = 100;
bars = [
    [ 62,90,86,20 ],
    [ 152,90,152,40 ],
    [ 98, 35, 110, 10 ],
    [ 118,40,123,15 ],
    [ 137, 43, 138, 15 ],
    
];

module thetext() {
//text("WONKA", font="MathJax\\_Caligraphic", size=40);
        scale([0.6,0.6]) import("wonka2.svg");
}

difference() {
    union() {
        cube([200,100,1]);
        color("red") for (bb=bars) 
             translate([(bb[0]+bb[2])/2,(bb[1]+bb[3])/2,5])
                 rotate([0,0,atan2(bb[3]-bb[1],bb[2]-bb[0])])
                     cube([sqrt((bb[2]-bb[0])^2+(bb[3]-bb[1])^2),1,10],center=true);
                     
    }
    translate([10,5,1]) linear_extrude(5) offset(1) thetext();
    translate([10,5,0]) linear_extrude(1) thetext();
}