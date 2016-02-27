# openscad_beams

Openscad Beams Library
=====

An openscad library to create complex objects easily


Motivation
-----

Ship or airplane hulls or models thereof are often constructed from frames 
which define beams and the external shape of the hull.

This technique is also useful for construction in openscad, particularly
in 3d printing.

I have been using this technique manually for quite some time, constructing 
my frames one by one, placing them and connecting them using the openscad
hull command.

This library attempts to somewhat automate the task. All you need to do is
define your frames (size, offset, rotation) in a list and pass this list 
to a library module.

The library module constructs the hull shape from the list.

If you want to change something, you can easily do so by adjusting the parameters
in the list, whithout any further code changes.

I have found this technique quite useful for both simple and complex objects.


Usage
-----

- include beams library in your openscad file
- define your frame params in an array
- call library module beam_multi using your frame array as param
- see template.scad in folder lib for an example
- see any of the more complex examples in folder lib_with_examples
  (e.g. example_complex02, which demonstrates how simply a complex shape can be defined using the library and mirroring)
- for debugging you can use the named parameter no_hull=true when calling beam_multi for only showing the frames (without the hull)


Development
-----

planned:
- optionally use alternating colors for the hull segements for easier visual debugging in openscad
- support non rectangular frames (circles, trapezoid)


Author
-----

Stemer114 (stemer114@gmail.com)

License
-----

Copyright (C) 2016 Stemer114 (stemer114@merunka.de)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


Credits: 
-----

 for some of the examples
 MCAD Library - Polyholes Copyright 2011 Nophead (of RepRap fame)
 It is licensed under the terms of Creative Commons Attribution 3.0 Unported.
 https://github.com/SolidCode/MCAD/blob/master/polyholes.scad

 BeamsVersion, libEcho and code structure inspired by 
 OpenSCAD Parts Library by randyy is licensed under the GNU - LGPL license. 
 http://www.thingiverse.com/thing:6021


