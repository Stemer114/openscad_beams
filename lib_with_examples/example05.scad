/*
 * a collection of simple examples for beams library
 * example for using openscad beams library
 *
 */

ep = 0.01;  //epsilon environment

include <beams.scad>

//          w   h   rotation   offset    thickness
params = [ 
           [20, 5,  [0, 0, 0], [-10, 0, 0], ep ],
           [30, 5,  [0, 0, 0], [-15, 20, 0], ep ],
           [30, 20, [0, 0, 0], [-15, 20, 0], ep ],
           [30, 20, [0, 0, 0], [-15, 25, 0], ep ],
           [15, 5,  [0, 0, 0], [0, 25, 0], ep ],
           [15, 5,  [0, 0, 0], [0, 50, 0], ep ],
           [30, 20, [0, 0, 0], [-15, 70, 0], ep ],
           [30, 20, [0, 0, 0], [-15, 85, 0], ep ],
           [30, 5, [0, 0, 0], [-15, 85, 0], ep ],
           [10, 5, [0, 0, 0], [-15, 110, 0], ep ],
         ];

beam_multi(frames=params );

