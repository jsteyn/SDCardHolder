/**

**/
xs=17.5 * 6;
ys=37;
zs=3;
fn=20;

difference() {
    cube([xs, ys, zs], center=true);
    union() {
        translate([-(17.5/2 ), 0, 0]){
            card();
        }
        translate([-(17.5/2*3 ), 0, 0]){
            card();
        }
       translate([-(17.5/2*5 ), 0, 0]){
            card();
        }
    }
}

translate([0, ys/2-1, 0]) {
    rotate([0, 90, 0]) {
        cylinder(d=zs,h=xs, center=true, $fn=4);
    }
}
translate([0, -ys/2+1, 0]) {
    rotate([0, 90, 0]) {
        cylinder(d=zs,h=xs, center=true, $fn=4);
    }
}

module rod(ht=8, diam=6, fn=50) {

    translate([0, -ht/2, 0]) {
        sphere(d=diam, $fn=fn);
    }
    translate([0, ht/2, 0]) {
        sphere(d=diam, $fn=fn);
    }
    rotate([90, 0, 0]) {
        cylinder(d=diam, h=ht, center=true, $fn=fn);
    }
}

module card() {
        union() {
        translate([.75, 3, 1]) {
            cube([11.5,4,1], center=true);
        }
        translate([.75, -ys/2+4.2, 1]) {
            cube([11.5,4,1], center=true);
        }
         translate([0,15.3/2+1, 1]) {
            cube([10, 15.3, 1], center=true);
        }
        translate([0, -15.3/2-1, 1]) {
            cube([10, 15.3, 1], center=true);
        }
        d=8;
        h=6;
        translate([17.5/4+1.5, -15.3/2-1, d/2]) {
            rod(ht=h, diam=d, $fn=fn);
        }
        translate([17.5/4+1.5,+15.3/2+1,d/2]) {
            rod(ht=h, diam=d, $fn=fn);
        }
    }
}