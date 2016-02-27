/*
 * example for beams library
 *   complex example (actually a tiltable stand for a barbie toy motorcycle..)
 *
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
disable_hull = false;
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
    [3, 4, [0, 0, 90], [0, -1.5, 0], ep ],   //start (front center)
    [3, 4, [0, 0, 90], [4, -1.5, 0], ep ],   //end of smaller center part
    [4, 4, [0, 0, 90], [6, -2, 0], ep ],  
    [4, 4, [0, 0, 90], [9, -2, 0], ep ],     //end of center part
    [4, 8, [0, 0, 90], [9, -2, 0], ep ],     //begin of first corner (higher than center part)
    [4, 8, [0, 0, 90], [12, -2, 0], ep ],  
    [4, 8, [0, 0, 90], [9, -2, 0], ep ],   
    [4, 8, [0, 0, 0],  [9, 2, 0], ep ],      //begin of longitudinal member
    [4, 8, [0, 0, 0],  [9, 5, 0], ep ],      //ramp down to narrower/lower center part of longitudinal member
    [3, 4, [0, 0, 0],  [9, 10, 0], ep ],   
    [3, 4, [0, 0, 0],  [8, 30, 0], ep ],   
    [3, 6, [0, 0, 0],  [8, 34, 0], ep ],   
    [4, 6, [0, 0, 0],  [8, 36, 0], ep ],     //end of longitudinal member
    [4, 6, [0, 0, 90], [8, 36, 0], ep ],     //begin of rear cross member
    [4, 6, [0, 0, 90], [14, 36, 0], ep ],     //begin of rear cross member
    [3, 4, [0, 0, 90], [17, 36, 0], ep ],    //smaller center part of rear cross member
    [3, 4, [0, 0, 90], [24, 36, 0], ep ],    //begin of ramp up to end parts
    [5, 6, [0, 0, 90], [27, 36, 0], ep ],    //end part
    [5, 6, [0, 0, 90], [30, 36, 0], ep ],  
    ];

//cutout for magnet
P01 = 4.1;  //dia
P02 = 1.5;  //depth


//**********************
//**** component modules
//**********************

//half arm 
module arm()
{
    difference()
    {

        beam_multi(frames=arm_params, no_hull=disable_hull );

        //cutout for magnet
        translate([8-2*ep, 36, 3])
        rotate([0, 90, 0])
        polyhole(h=P02, d=P01);
    }
} //arm

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

        }

        //all structures that need to be cut away
        union()
        {

        }

    }  //difference

}  //end main_body


main_body();


// *****************
// * support modules
// *****************


