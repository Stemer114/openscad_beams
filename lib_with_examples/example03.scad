/*
 * a collection of simple examples for beams library
 * example for using openscad beams library
 *
 */

ep = 0.01;  //epsilon environment

include <beams.scad>

//          w   h   rotation   offset    thickness
params = [ 
           [10, 10, [0, 0, 0], [0, 0, 0], ep ],
           [20, 20, [0, 0, 0], [0, 25, 0], ep ],
           [10, 10, [0, 0, 0], [0, 50, 0], ep ] 
         ];

beam_multi(frames=params );

