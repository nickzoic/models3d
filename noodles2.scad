$fn=50;

seed=45;
od=13;
id=8;
num=50;

noodles = [ for (n=[1:num]) rands(-180,180,3,n*seed) ];
    
intersection() {
    sphere(d=50);
    difference() {
        union() {
            sphere(d=20);
            for (n = noodles) {
                rotate(n) cylinder(d=od,h=100);
            }
        }
        for (n = noodles) {
            rotate(n) cylinder(d2=id,d1=0,h=25);
        }
        sphere(d=16);
     
    }
}
