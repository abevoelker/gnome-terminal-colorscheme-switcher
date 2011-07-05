
gnome-terminal colorscheme switcher
===================================
This is just a simple Rake script for switching gnome-terminal color schemes.
Sadly gnome-terminal couples the idea of color schemes to profiles; one must
either use the few hardcoded colorschemes that come with it or awkwardly
use completely custom values through the GUI interface or `gconftool`. I
created this after getting tired of hand-editing `%gconf.xml` files.

I stole the [Solarized](http://ethanschoonover.com/solarized) colors from
[this repo](https://github.com/sigurdga/gnome-terminal-colors-solarized),
which also inspired me to create this little tool which isn't focused around
a particular color scheme.

Usage
=====
    rake set scheme=solarized_light profile=abe

If a profile is not specified, the `Default` profile will be used:

    rake set scheme=solarized_light

Adding a theme
==============
Just follow the simple template of the YML files in the `colorschemes`
directory.
