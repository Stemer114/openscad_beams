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
- call library module beam multi using your frame array as param

the usage is quite simple, just start with one of the examplexx.scad files

Author
-----

(c) 2016 by Stemer114 (stemer114@gmail.com)

License
-----

Released under the GNU GENERAL PUBLIC LICENSE, see file LICENSE


