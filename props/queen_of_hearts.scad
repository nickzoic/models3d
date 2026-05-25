$fn=100;
depth=40;
botDia=3;
raise=45;
upLobe=50;
outLobe=.5;
smidge=.1;

//
intersection() {
    difference() {
        scale([2,1,2])
        oneHeart();
        cylinder(h=150,d=21,center=true);
        translate([45,0,100]) rotate([-90,0,0]) {
            cylinder(d1=5,d2=0,h=2.5);
            cylinder(d=2.2,h=10);
        }
        translate([-45,0,100]) rotate([-90,0,0]) {
            cylinder(d1=5,d2=0,h=2.5);
            cylinder(d=2.2,h=10);
        }
    }
    translate([0,500,0]) cube(1000, center=true);
}

module oneHeart()
{
    union()
    {
        oneLobe();
        rotate([0,0,180])oneLobe();
    }
}
module oneLobe()
{
    hull()
    {
        translate([-depth*outLobe,0,upLobe])
            scale([1.2,1,1.3])sphere(d=depth);
        centerSurface();
    }
}
module centerSurface()
{
    rotate([0,0,0])hull()
    {
        translate([0,0,raise])scale([1.5,1,1])rotate([0,90,0])cylinder(d=depth,h=smidge,center=true);
        scale([1,1.5,1])sphere(d=botDia);
    }
}