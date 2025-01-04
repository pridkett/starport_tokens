Starport Tokens 
===============

Patrick Wagstrom

January 2025

Overview
--------

I've been introducing some kids to
[Starport](https://www.widerpathgames.com/collections/starport), which is a kid
friendly role playing game. A lot of the abilities in the game are kept track
of by using "trait tokens", which in the manual are something that you'd cut
out and hand out little pieces of paper, or just erase a lot on your character
sheet. I've found that these 3d printed tokens make playing the game a little
bit more fun for the kids and saves the problems a child getting upset because
they've erased through their character sheet or forgot to update it at some
point in the story.

Usage
-----

There are five different base SVGs included in this set. You can either open up
`Starport Tokens.scad` inside of the OpenSCAD GUI and change the value of
`svg_file` accordingly, or you can generate all of the files from the command
line. Here's what I used to create the files that I published to Printables for
this work:

```bash
openscad -o energy.3mf -D 'svg_file="energy.svg"' Starport\ Tokens.scad
openscad -o helpful.3mf -D 'svg_file="helpful.svg"' Starport\ Tokens.scad
openscad -o smart.3mf -D 'svg_file="smart.svg"' Starport\ Tokens.scad
openscad -o sneaky.3mf -D 'svg_file="sneaky.svg"' Starport\ Tokens.scad
openscad -o tough.3mf -D 'svg_file="tough.svg"' Starport\ Tokens.scad
```

For printing, you've got some options. These print just fine at 0.2mm layer
height and 15% infill. PrusaSlicer will detect that these look like logos and
offer to insert a pause in the middle, which is great because it makes it easy
to change the color and make two color tokens. However, the default height is
3mm, which means that you'll have one half of each token just a little bigger
than the other because you'll have an odd number of layers. Because I'm a
perfectionist-ish, I use a 0.15mm layer height to make both sides of the token
equal. I also increase the infall to 100% to give the tokens a little more
heft. They're small and most of it's 100% infill anyway because of top and
bottom surfaces, so this doesn't add a lot of additional filament usage.

Expanding and Creating New Tokens
---------------------------------

To the best of my knowledge [OpenSCAD's SVG import
function](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/SVG_Import) does
not currently support any mechanism to automatically rescale an imported SVG or
to get the dimensions of the SVG. The way that I've gotten around this is by
making each SVG 1mmx1mm. You can change this by editing the line that reads
`scale_factor = max_inlay_diameter / 1;` and changing the `1` to something
bigger, like 100 if you've got 100mmx100mm SVG images you're using.

My general workflow for this is to create my image at a higher scale which lets
me think better about it. Then I shrink the size of the page to the size of the
drawing in Inkscape. Then I scale the image so it's at most 1mm in the largest
dimension, and finally, I set the dimensions of the document to 1mmx1mm. Once
you've got that image, it's as simple as just passing in the name of the file
to the `svg_file` variable and then it should generate the model for you.

License 
-------

As much as I'd like to license this under something like the BSD license, they
use images from the [Starport RPG rules from Wider Path Games](https://www.widerpathgames.com/collections/starport), which are licensed under the
[Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).

Therefore, derivitives of Starport must also be non-commercial licensed. Thus, this work is also licensed under terms of the [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).
