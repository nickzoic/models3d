s=30;

$fn=40;
module corner(n) {
    x = n % 2 ? s/2 : -s/2;
    y = floor(n / 2) % 2 ? s/2 : -s/2;
    z = floor(n / 4) % 2 ? s/2 : -s/2;
    
    translate([x,y,z]) sphere(r=3);
}

module edge(n1,n2) {
    hull() {
        corner(n1);
        corner(n2);
    }
}

difference() {
    rotate([45,35.264,0]) {
        cube([s+3,s+3,s+3],center=true);
        
        edge(0,1);
        edge(1,3);
        edge(3,2);
        edge(2,0);

        edge(4,5);
        edge(5,7);
        edge(7,6);
        edge(6,4);

        edge(0,4);
        edge(1,5);
        edge(3,7);
        edge(2,6);
    }
    translate([0,0,-200]) cube([400,400,400],center=true);
    
    intersection() {
        cube([16,16,50],center=true);
        cylinder(d1=40,d2=0,h=25);
    }
}