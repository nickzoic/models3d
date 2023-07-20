$fn=20;

module trunk(x, n) {
    if (x == n) {
        cylinder(h=x*2,d1=x,d2=x-2);
    } else if (x > n) {
        translate([0,0,2*x]) {
            rotate([22.5,10,0]) trunk(x-1, n);
            rotate([0,49.5,81]) trunk(x-1, n);
           
        }
    }
}

module leaves(x, n) {
    if (x == n) {
        translate([0,0,2*x])
        sphere(d=x*1.5);
    } else if (x > n) {
        translate([0,0,2*x]) {
            rotate([22.5,10,0]) leaves(x-1, n);
            rotate([0,49.5,81]) leaves(x-1, n);
        }
    }
}

//fnord(20);

module base() {
    translate([0,0,0]) cylinder(d1=150,d2=150,h=10);
    translate([0,0,10]) cylinder(d1=150,d2=50,h=10);
    translate([0,0,20]) cylinder(d1=50,d2=20,h=13);
}

module make(n) {
    if (n==0) { base(); trunk(20,20); }
    else if (n==7) { 
        leaves(20,20-n+1);
    }
    else {
        trunk(20,20-n);
    }
    
}
colors = ["black","brown","red","orange","yellow","green","blue","purple"];

material = 0;

if (material == 0) {
    for (n = [0:len(colors)-1]) {
        color(colors[n]) make(n);
    }
} else if (material <= len(colors)) {
    difference() {
        make(material-1);
        if (material>1)
        for(n=[1:material-1]) {
            make(n-1);
        }
    }
}