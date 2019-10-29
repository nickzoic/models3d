pin_offsets = [
    [ 0, 0.275 ],
    [ 0, 0.160 ],
    [ 0, 0.0825 ],
    [ 0.027, 0 ],
    [ 0.100, 0 ],
    [ 0.170, 0 ],
    [ 0.302, 0 ]
]

difference() {
    cube([50,50,10],center=true);
    for (po in pin_offsets) {
        translate(po[0],po[1],0) cylinder(h=50,d=1,center=true);
    }
}
