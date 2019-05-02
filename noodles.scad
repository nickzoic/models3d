$fn=50;

seed=45;
od=13;
id=10;
num=50;

noodles = [ for (n=[1:num]) rands(-20,20,6,n*seed) ];
    
intersection() {
    sphere(d=50);
    difference() {
        union() {
            for (n = noodles) {
                //translate([n[0],n[1],n[2]])
                rotate([n[3]*20,n[4]*20,n[5]*20]) cylinder(d=od,h=100);
            }
        }
        for (n = noodles) {
            //translate([n[0],n[1],n[2]])
            rotate([n[3]*20,n[4]*20,n[5]*20]) cylinder(d=id,h=100);
        }
     
    }
}
