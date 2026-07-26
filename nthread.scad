// this exists because I wanted to work out 
// how to do it with polyhedrons, but there's
// a large number of thread libraries out there
// already with more features than this so you
// should use one of them instead.
// eg: https://github.com/adrianschlatter/threadlib
// that being said, if you only want metric threads
// with no dependencies, go for it.


// based on https://en.wikipedia.org/wiki/ISO_metric_screw_thread
// a list of [offset, depth] where offset and depth are in fractions
// of pitch.

metric_thread_form = [
    [ 0,     21*sqrt(3)/32 ],  // a tiny bit of curve at the back
    [ 1/16,  5*sqrt(3)/8  ],
    [ 7/16,  0            ],
    [ 9/16,  0            ],
    [ 15/16, 5*sqrt(3)/8  ],
];

module thread(d_maj,pitch,length,form=metric_thread_form,fn=64) {
    na = fn*length/pitch;
    nf = len(form);
    points = concat(
        [
            for (f=[0:nf-1])
            for (a=[0:na-1])
            [
                (d_maj/2 - pitch * form[f][1]) * cos(a*360/fn),
                (d_maj/2 - pitch * form[f][1]) * sin(a*360/fn),
                form[f][0] + a*pitch/fn
            ]
        ],
        [ [0, 0, 0], [ 0, 0, length ] ]
    );
    faces = concat(
        [
            for(a=[0:fn-1])
            [ nf*na, a, a+1 ]
        ],
        [
            for(f=[0:nf-2])
            [ nf*na, f*na, (f+1)*na]
        ],
        [ [ nf*na, na*(nf-1), fn ] ],
        [
            for (f=[0:nf-2])
            for (a=[0:nf<nf-2 ? na-1 : na-2])
            [ f*na+a, (f+1)*na+a, (f+1)*na+a+1, f*na+a+1 ]
        ],
        [
            for (a=[0:na-fn-2]) 
            [ fn+a, fn+a+1, na*(nf-1)+a+1, na*(nf-1)+a ]
        ],
        [
            for(a=[0:fn-1])
            [ na*nf+1, na*nf-fn+a-1, na*nf-fn+a ]
        ],
        [  
            for(f=[1:nf-1]) 
            [ nf*na+1, na*f-1, na*(f+1)-1 ] 
        ],
        [ [ nf*na+1, na*nf-fn-1, na-1 ] ]
    );
    intersection() {
        polyhedron(points, faces, convexity=length/pitch);
        //cylinder(d=d_maj*1.1,h=length);
    }
    
    //color("green") translate(points[na*nf-1]) sphere(d=0.1);
    //color("red") translate(points[na*nf-fn-1]) sphere(d=0.1);
    //color("orange") translate(points[na*(1)-1]) sphere(d=0.1);
    //color("blue") translate(points[na*(nf-1)+1]) sphere(d=0.1);
}


thread(8,1,4.5);