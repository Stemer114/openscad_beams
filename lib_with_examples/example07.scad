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
           [10, 20, [0, 0, 0], [0, 40, 0], ep ],
           [10, 20, [0, 0, 135], [10, 40, 0], ep ],
           [10, 20, [0, 0, 135], [40, 70, 0], ep ],
           [10, 20, [0, 0, 0], [30, 90, 0], ep ],
           [10, 10, [0, 0, 0], [30, 125, 0], ep ],
         ];

beam_multi(frames=params );

