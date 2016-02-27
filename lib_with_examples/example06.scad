/*
 * a collection of simple examples for beams library
 * example for using openscad beams library
 *
 */

ep = 0.01;  //epsilon environment

include <beams.scad>

//          w   h   rotation   offset    thickness
params = [ 
           [20, 5, [0, 0, 0], [0, 0, 0], ep ],     //front flange
           [20, 5, [0, 0, 0], [0, 30, 0], ep ],
           [5, 5, [0, 0, 0], [0, 40, 0], ep ],
           [5, 20, [0, 0, 0], [0, 40, 0], ep ],    //vertical bar
           [5, 30, [0, 0, 0], [0, 60, 0], ep ],
           [5, 5, [0, 0, 0], [0, 60, 0], ep ],     //rear flange
           [20, 5, [0, 0, 0], [0, 70, 0], ep ],
           [20, 5, [0, 0, 0], [0, 100, 0], ep ],  
         ];

beam_multi(frames=params );

