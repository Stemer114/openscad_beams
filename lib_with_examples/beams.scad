/* 
 * openscad beams library
 * create complex openscads objects from frames which are defining beams
 * (constructed like a ship body or airplane hull)
 *
 * https://github.com/Stemer114/openscad_beams
 * http://www.thingiverse.com/Stemer114/designs
 * 
 *    Copyright (C) 2016 Stemer114 (stemer114@merunka.de)
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *

 * Credits: 
 *          for some of the examples
 *          MCAD Library - Polyholes Copyright 2011 Nophead (of RepRap fame)
 *          It is licensed under the terms of Creative Commons Attribution 3.0 Unported.
 *          https://github.com/SolidCode/MCAD/blob/master/polyholes.scad
 *
 *          BeamsVersion, libEcho and code structure inspired by 
 *          OpenSCAD Parts Library by randyy is licensed under the GNU - LGPL license. 
 *          http://www.thingiverse.com/thing:6021
 *
 */

//**** house keeping
//we define these as functions to avoid assignment problems from caller modules
function BeamsVersion() = 1.0;  //library version
function ep()=0.01;  //epsilon environment to avoid non-manifold objects


//**** module definitions

// a single rectangular frame, usually very thin
// params: w - width of frame (x direction)
//         h - height of frame (z direction)
//         d - thickness of frame (y direction, usually very thin, e.g. 0.1mm)
//         o - offset vector from origin (probably best to use x and y offsets only here for starters)
//         r - rotation vector (probably best to use only z rotation here for starters)
//         vec - vector interface, used instead of the named params
//         the vector must use the following structure (example)
//           w  h  rotation    offset        thickness
//          [3, 4, [0, 0, 90], [0, -1.5, 0], ep ],   //start (front center)
//         there is no checking other than length checking to branch in the interface
//         so better make sure the vector conforms
//         the vector interface allows you to define a list of vectors in your source file
//         and supply them all at once to the beam module (see below)
//         this probably makes more sense if you look at some of the example files
module frame(
        w = 10,  //width
        h = 10,  //height
        r = [0, 0, 0],  //rotation vector
        o = [0, 0, 0],   //offset vector
        d = ep(),  //thickness (normally very thin)
        vec = [],  //vector, default none
        )
{
    if ( len(vec)==5 ) {
        //use vector interface
        translate( vec[3] )
            rotate( vec[2] )
            cube([ vec[0], vec[4], vec[1] ]);
    } else {
        //use single param interface
        translate(o)
            rotate(r)
            cube([w, d, h]);
    }  //end else
}  //end module

// a single beam consisting of two frames at either end, connected by a hull
// to disable hull, use no_hull=true (for debugging)
// beam uses the vector interface (see above in module frame)
module beam(
        frame1 = [10, 10, [0, 0, 0], [0, 0, 0], ep() ],
        frame2 = [10, 10, [0, 0, 0], [0, 20, 0], ep() ],
        no_hull = false,   
        )
{
    if ( no_hull ) {
        frame(vec=frame1);
        frame(vec=frame2);
    } else {
        hull() {
            frame(vec=frame1);
            frame(vec=frame2);
        }  //end hull
    }  //end else
}  //end module

// a beam consisting of 2 or more frames connected by hulls
// uses the vector interface (see above)
// see example scad files in library source to get an idea how to use this
module beam_multi(frames=[], no_hull=false )
{
    if ( len(frames)<2 ) {
        echo("WARNING: beam_multi: number of frames too small (must be at least 2): ", len(frames) );
    } else {
        for ( frame = [0:len(frames)-2] ) {
            beam( frames[frame], frames[frame+1], no_hull=no_hull );
        } //end for

    }
}

/*************************************************
 * interface 
*/

libEcho=true;
if (libEcho!=false){ 
	echo("****************************************************************  ");
    echo(" beams scad library loaded.");
    echo(" Version: ", BeamsVersion() );
    echo(" usage: - include beams.scad in your project dir,");
    echo("        - then add include <beams.scad> to your script ");
	echo("        - to turn off this header, place libEcho=false; in your script");
    echo("        - see examples scad files to some inspiration")
	echo("****************************************************************  ");
}

