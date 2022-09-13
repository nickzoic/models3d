import random

def make_mesh(nx, ny, nz):

    def number(x,y,z):
        return z * ny * nx + y * nx + x

    mesh = dict()

    for x in range(0, nx):
        for y in range(0, ny):
            for z in range(0, nz):
                nn = set()
                if x > 0: nn.add(number(x-1,y,z))
                if x < nx-1: nn.add(number(x+1,y,z))
                if y > 0: nn.add(number(x,y-1,z))
                if y < ny-1: nn.add(number(x,y+1,z))
                if z > 0: nn.add(number(x,y,z-1))
                if z < nz-1: nn.add(number(x,y,z+1))
                mesh[number(x,y,z)] = nn

    return mesh

def is_connected(mesh):
    mesh_keys = set(mesh.keys())
    new_keys = set([list(mesh_keys)[0]])
    found_keys = set()

    while len(new_keys) and len(found_keys) < len(mesh_keys):
        new_key = new_keys.pop()
        new_keys.update(mesh[new_key].difference(found_keys))
        found_keys.update(mesh[new_key])

    return len(found_keys) == len(mesh_keys)

def perturb_mesh(mesh):
    key1 = random.choice(list(mesh.keys()))
    key2 = random.choice(list(mesh[key1]))
    new = mesh.copy()
    new[key1] = mesh[key1].copy()
    new[key1].remove(key2)
    new[key2] = mesh[key2].copy()
    new[key2].remove(key1)
    return new

def mesh_to_pairs(mesh):
    for key1 in mesh.keys():
        for key2 in mesh[key1]:
            if key2 > key1:
                yield key1, key2

dim = 5

ball = 10

print("""
// http://forum.openscad.org/Rods-between-3D-points-tp13104p13115.html
module rod(p1,p2,d){ // draw ray between 2 specified points
  translate((p1+p2)/2)
    rotate([-acos((p2[2]-p1[2]) / norm(p1-p2)),0,
            -atan2(p2[0]-p1[0],p2[1]-p1[1])])
       cylinder(d=d, h=norm(p1-p2), center = true);
}
$fn=16;
difference() { union() {
""")

mesh = make_mesh(dim,dim,dim)

def find_xyz(n):
   return (n // (dim * dim)) * 10, ((n // dim) % dim) * 10, (n % dim) * 10 

for k1 in mesh.keys():
    x1,y1,z1 = find_xyz(k1)
    print("        translate([%d,%d,%d]) sphere(d=%f); // %d" % (x1,y1,z1,ball+3,k1))

for k1, k2 in mesh_to_pairs(mesh):
    x1,y1,z1 = find_xyz(k1)
    x2,y2,z2 = find_xyz(k2)
    print("rod([%d,%d,%d],[%d,%d,%d],%f); // %d -- %d" % (x1,y1,z1,x2,y2,z2,ball+3,k1,k2))

print("}")

#for k1, k2 in mesh_to_pairs(mesh):
#    x1,y1,z1 = find_xyz(k1)
#   x2,y2,z2 = find_xyz(k2)
#    print("rod([%d,%d,%d],[%d,%d,%d],%f); // %d -- %d" % (x1,y1,z1,x2,y2,z2,ball-1,k1,k2))

count = 1000
while count:
    new = perturb_mesh(mesh)
    if is_connected(new):
        mesh = new
        count = 1000
    else:
        count -= 1

for k1, k2 in mesh_to_pairs(mesh):
    x1,y1,z1 = find_xyz(k1)
    x2,y2,z2 = find_xyz(k2)
    print("rod([%d,%d,%d],[%d,%d,%d],%f); // %d -- %d" % (x1,y1,z1,x2,y2,z2,ball+1,k1,k2))

print("}")
