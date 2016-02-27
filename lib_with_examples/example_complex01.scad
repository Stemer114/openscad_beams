/*
 * a collection of complex examples for beams library
 * example for using openscad beams library
 *
 */

ep = 0.01;  //epsilon environment
x_offset = 40;  //test offset for aligning test objects along x-axis


include <beams.scad>

//Test 1
//two single assignment beams
translate([x_offset*0, 0, 0])
{
    frame();
    frame(5, 5, [0, 0, 45], [0, 10, 0]);
}

//Test 2
//assign beam params using vector (single vector)
beam_1 = [ 20, 20, [0, 0, 0], [0, 0, 0], ep ];
translate([x_offset*1, 0, 0]) frame(vec=beam_1);

//Test 3
//assign beam params using vector (multi-dimensional vector)
beam_2 = [ 
    //w   h   rotation   offset    thickness
    [10, 10, [0, 0, 0], [0, 0, 0], ep ],  //first frame
    [15, 15, [0, 0, 0], [5, 10, 0], ep ] //second frame
    ];
translate([x_offset*2, 0, 0])
{
    frame(vec=beam_2[0] );
    frame(vec=beam_2[1] );
} 

//Test 4
//beam with two frames
beam_3 = [ 
    //w   h   rotation   offset    thickness
    [10, 10, [0, 0, 0], [0, 0, 0], ep ],  //first frame
    [20, 20, [0, 0, 45], [-5, 20, 0], ep ] //second frame
    ];
translate([x_offset*3, 0, 0])
{
    beam( beam_3[0], beam_3[1] );
} 


//Test 5
//complex beam with multiple frames
beam_4 = [ 
    //w   h   rotation   offset    thickness
    [10, 10, [0, 0, 0], [0, 0, 0], ep ],  
    [10, 15, [0, 0, 0], [5, 20, 0], ep ],  
    [10, 10, [0, 0, 0], [0, 40, 0], ep ],  
    [15, 10, [0, 0, 0], [0, 50, 0], ep ],  
    [10, 10, [45, 0, 0], [0, 70, 10], ep ],  
    ];
translate([x_offset*4, 0, 0])
{
    beam_multi(frames=beam_4 );
} 

//Test 6
//complex shape with multiple frames
beam_5 = [ 
    //w   h   rotation   offset    thickness
    [10, 10, [0, 0, 0], [0, 0, 0], ep ],  
    [10, 10, [0, 0, -45], [0, 20, 0], ep ],  
    [10, 10, [0, 0, -45], [30, 20, 0], ep ],  
    [10, 10, [0, 0, 0], [30, 40, 0], ep ],  
    ];
translate([x_offset*5, 0, 0])
{
    beam_multi(frames=beam_5 );
} 


//Test 7
//multi beam with only two frames
beam_6 = [ 
    //w   h   rotation   offset    thickness
    [10, 20, [0, 0, 0], [-10/2, 0, -20/2], ep ],  //first frame
    [20, 10, [0, 0, 0], [-20/2, 40, -10/2], ep ] //second frame
    ];
translate([x_offset*7, 0, 0])
{
    beam_multi(frames=beam_6 );
} 
