/*
 * complex example for beams library
 * actually, a frame for shooting eye cover
 * here, multiple beams are combined with each other,
 * additionally, the frame is mirrored (only one half needs to be modelled)
 *
 * (c) 2016 by Stemer114 (stemer114@gmail.com)
 * see LICENSE
 *
 MCAD Library - Polyholes Copyright 2011 Nophead (of RepRap fame)
 It is licensed under the terms of Creative Commons Attribution 3.0 Unported.
 https://github.com/SolidCode/MCAD/blob/master/polyholes.scad

 according to ISSF regulations, the eye cover must not be wider than 30mm
 and 40mm long at the sides
 see http://www.champion-brillen.ch/5257.html
 the main version now supports this requirement
 (the eye cover is 30mm wide and 40mm long including the hinge supports)

 */

ep = 0.01;  //epsilon environment


//-----------------------------------------------------------------------------------
//libraries
//-----------------------------------------------------------------------------------
//beams lib (by me)
include <beams.scad>
//polyholes lib is in local dir
use <MCAD/polyholes.scad>

//*****************************
//flags for rendering components
//*****************************
show_mainbody = true;
//show_eyecover = true;

//******************
//parametric settings
//******************
w = 4;  //arm width
h = 5.2;  //arm base height
hA = 10;  //height at start (point A)
hD = 30;  //height at nose bridge

//***** params
//(right) arm - base shape will be mirrored
arm_params = [ 
    //w   h   rotation   offset    thickness
    [w, hA, [0, 0, 0], [63, 0, 0], ep ],    //A
    [w, hA, [0, 0, 0], [63, 5, 0], ep ],  
    [w, h, [0, 0, 0], [64, 10, 0], ep ],  
    [w, h, [0, 0, 0], [74, 40, 0], ep ],  
    [w, h, [0, 0, 0], [75, 70, 0], ep ],  
    [w, h, [0, 0, 0], [74, 100, 0], ep ],  
    [w, h, [0, 0, 0], [71, 120, 0], ep ],   //B
    [w, h, [0, 0, 45], [63, 138, 0], ep ],
    [w, h, [0, 0, 70], [50, 143, 0], ep ],  //C
    [w, h, [0, 0, 80], [14, 151, 0], ep ],
    [w, hD, [0, 0, 80], [10, 151, 0], ep ],
    [w, hD, [0, 0, 90], [4, 153, 0], ep ],   //D
    [w, hD, [0, 0, 90], [0, 153, 0], ep ],   //D
    ];
// P01xx - nose bridge cutout
P0110 = 18;  //top width
P0112 = 4;  //bottom dia front
P0113 = 14;   //           back
P0120 = 7;  //height
P0130 = 4*w;  //thickness

//hinge base
hinge_offset = 157;  //y offset for hinge edge
hinge_params = [ 
    //w   h   rotation   offset    thickness
    [hinge_offset-140, h, [0, 0, 90], [60, 140, 0], ep ],  
    [hinge_offset-143, h, [0, 0, 90], [50, 143, 0], ep ],  
    [hinge_offset-151, h, [0, 0, 90], [14,151, 0], ep ],  
    ];
//nut trap
nut_w = 5.5;  //wrench size (M3)
nut_h = 3;    //depth
nut1_offset = [14+10, 157+ep, h/2];
nut2_offset = [60-10, 157+ep, h/2];


//eye cover (tilts)
ed = 5;  //thickness
ed1 = 5; //lower thickness (edges)
ed2 = 3.2;  //lower thickness (middle)
eyecover_params = [ 
    //w   h   rotation   offset    thickness
    [28, ed1, [0, 0, 90], [2.5, 8, 0], ep ],
    [33, ed, [0, 0, 90], [4, 7, 0], ep ], 
    [40, ed, [0, 0, 90], [4, 0, 0], ep ],  //left hinge
    [40, ed, [0, 0, 90], [4+3, 0, 0], ep ],
    [33, ed, [0, 0, 90], [4+3, 7, 0], ep ], 
    [32, ed2, [0, 0, 90], [4+3+4, 8, 0], ep ], //thinner middle part
    [30, ed2, [0, 0, 90], [4+3+10, 10, 0], ep ], 
    [30, ed2, [0, 0, 90], [4+3+21-10, 10, 0], ep ], 
    [32, ed2, [0, 0, 90], [4+3+21-4, 8, 0], ep ], 
    [33, ed, [0, 0, 90], [4+3+21, 7, 0], ep ],  //right hinge
    [40, ed, [0, 0, 90], [4+3+21, 0, 0], ep ],  
    [40, ed, [0, 0, 90], [4+3+21+3, 0, 0], ep ],
    [33, ed, [0, 0, 90], [4+3+21+3, 7, 0], ep ],
    [28, ed1, [0, 0, 90], [4+3+21+3+1.5, 8, 0], ep ],
    ];
P0310 = 2.0;  //bore dia
P0312 = 3.5;    //bore offset from edge
P0320 = 5+2+31+2+5;  //length


//**********************
//**** component modules
//**********************

//half arm 
module arm()
{
        beam_multi(frames=arm_params );
} //arm

//nose bridge cutout
module nose_bridge_cutout()
{
    hull()
    {
        translate([-P0110/2, 0, P0120+ep]) cube([P0110, P0130, ep]);
        //rotate([-90, 0, 0]) polyhole(h=P0130, d=P0112);
        rotate([-90, 0, 0]) cylinder(h=P0130, r1=P0113/2, r2=P0112/2);
    }
} //nose_bridge_cutout

//hinge base
//(as the glasses are upside down, this needs to go to the right arm (for me))
module hinge_base()
{
    difference()
    {
        union()
        {
            //hinge base
            //beam_multi(frames=hinge_params, no_hull=true );
            beam_multi(frames=hinge_params );

        } //union 1

        union()
        {
            //nut traps for attaching polypropylene eye cover
            //west
            translate(nut1_offset)
                rotate([90, 0, 0])
                nut_trap(w=nut_w, h=nut_h);
            //east
            translate(nut2_offset)
                rotate([90, 0, 0])
                nut_trap(w=nut_w, h=nut_h);
        } //union 2
    }
}  //hinge_base


//***************************************************
//**** main body (constructed from component modules)
//***************************************************
module main_body()
{

    difference()
    {
        //all structures that define the object
        union()
        {
            //right arm
            arm();

            //left arm (mirrored right arm)
            mirror([1, 0, 0]) arm();

            //translate([-50, -144, 0])  //debugging: move to origin
 hinge_base();

        }

        //all structures that need to be cut away
        union()
        {
            //nose bridge cutout
            //needs to be moved to center top position of bridge, as defined by last row of arm_params
            //then down bridge height
            //I could do this parametrically, but for now just copy the values here
            translate([0, 153-P0130/2, hD-P0120]) nose_bridge_cutout();
            //# nose_bridge_cutout();


        }

    }  //difference

}  //end main_body


module eyecover()
{
    difference()
    {
        beam_multi(frames=eyecover_params, no_hull=false );
        
        //bore
        translate([0, P0312, ed/2])
        rotate([0, 90, 0])
        polyhole(h=P0320, d=P0310);
    }
} //eyecover



// **************
// render objects
// **************
if ( show_mainbody ) {
    main_body();
}

if ( show_eyecover ) {
    translate([0, 50, 0])
    eyecover();
}



// *****************
// * support modules
// *****************

//nut trap
//default values are for M3 nut
//if you use this module as a nut trap cutout, you need to add +de (ie 0.1mm or similiar) to height
//in order to get non-manifold cutouts
module nut_trap (
        w = 5.5,
        h = 3
        )
{
        cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
}    


