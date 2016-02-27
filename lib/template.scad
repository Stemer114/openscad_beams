/*
 * simple template for using openscad beams library
 * see https://github.com/Stemer114/openscad_beams
 *
 */

ep = 0.01;  //epsilon environment

include <beams.scad>

//          w   h   rotation   offset    thickness
params = [ 
           [10, 10, [0, 0, 0], [0, 0, 0], ep ],  //first frame
           [10, 20, [0, 0, 0], [0, 50, 0], ep ],  //second frame
           //expand frames as required
         ];

//construct beam using params defined above
beam_multi(frames=params );

