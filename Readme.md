# Description

This is a [gnuplot](http://www.gnuplot.info) (v5.4.5) docker image based on [alpine](https://hub.docker.com/_/alpine) (v3.17.0).

# Quick Start

```
docker pull gitrust/gnuplot

docker run --rm -v $(pwd):/home/docker:rw gitrust/gnuplot
```

# Reference

- https://github.com/gitrust/docker.gnuplot
- https://hub.docker.com/repository/docker/gitrust/gnuplot
- http://www.gnuplot.info
- https://pango.gnome.org
- https://gnuplot.sourceforge.net/demo

# Usage examples

```
docker run --rm -v $(pwd):/home/docker:rw gitrust/gnuplot
```

An example with a script
```
docker run --rm -v $(pwd):/home/docker:rw gitrust/gnuplot -e "set terminal png; set output 'out.png'; plot sin(x); replot"
```

Plotting a chart using a gnu source file
```
docker run --rm -v $(pwd):/home/docker:rw gitrust/gnuplot chart.gnu
```

# Build Configuration

gnuplot was compiled with additional plugins and tool support

Support for 

- cairo (cairo terminals)
- pango (library for text layout and rendering)
- libgd (Font handling for the png, gif, jpeg, and sixelgd terminals)

Options compiled into gnuplot binary

```
$ docker run --rm -v $(pwd):/home/docker:rw gitrust/gnuplot -e "show version long"

        G N U P L O T
        Version 5.4 patchlevel 5    last modified 2022-09-28

        Copyright (C) 1986-1993, 1998, 2004, 2007-2022
        Thomas Williams, Colin Kelley and many others

        gnuplot home:     http://www.gnuplot.info
        faq, bugs, etc:   type "help FAQ"
        immediate help:   type "help"  (plot window: hit 'h')

Compile options:
    -READLINE  +LIBREADLINE  +HISTORY
    +OBJECTS  +STATS +EXTERNAL_FUNCTIONS
    +LIBCERF  +GD_PNG  +GD_JPEG  +GD_TTF  +GD_GIF  +ANIMATION
    -USE_CWDRC  +X11  +USE_MOUSE  +HIDDEN3D_QUADTREE
    64-bit integer arithmetic

GNUPLOT_DRIVER_DIR = "/usr/local/libexec/gnuplot/5.4"
GNUPLOT_PS_DIR     = "/usr/local/share/gnuplot/5.4/PostScript"
HELPFILE           = "/usr/local/share/gnuplot/5.4/gnuplot.gih"
```

# Available terminal types

```
       cairolatex  LaTeX picture environment using graphicx package and Cairo backend
           canvas  HTML Canvas object
              cgm  Computer Graphics Metafile
          context  ConTeXt with MetaFun (for PDF documents)
          domterm  DomTerm terminal emulator with embedded SVG
             dumb  ascii art for anything that prints text
              dxf  dxf-file for AutoCad (default size 120x80)
              emf  Enhanced Metafile format
         epscairo  eps terminal based on cairo
         epslatex  LaTeX picture environment using graphicx package
              fig  FIG graphics language V3.2 for XFIG graphics editor
              gif  GIF images using libgd and TrueType fonts
             hpgl  HP7475 and relatives [number of pens] [eject]
             jpeg  JPEG images using libgd and TrueType fonts
               mf  Metafont plotting standard
               mp  MetaPost plotting standard
             pcl5  PCL5e/PCL5c printers using HP-GL/2
         pdfcairo  pdf terminal based on cairo
           pict2e  LaTeX2e picture environment
              png  PNG images using libgd and TrueType fonts
         pngcairo  png terminal based on cairo
       postscript  PostScript graphics, including EPSF embedded files (*.eps)
          pslatex  LaTeX picture environment with PostScript \specials
            pstex  plain TeX with PostScript \specials
         pstricks  LaTeX picture environment with PSTricks macros
          sixelgd  sixel using libgd and TrueType fonts
              svg  W3C Scalable Vector Graphics
          tek40xx  Tektronix 4010 and others; most TEK emulators
          tek410x  Tektronix 4106, 4107, 4109 and 420X terminals
          texdraw  LaTeX texdraw environment
         tkcanvas  Tk canvas widget
          unknown  Unknown terminal type - not a plotting device
            vttek  VT-like tek40xx terminal emulator
              x11  X11 Window System interactive terminal
             xlib  X11 Window System (dump of gnuplot_x11 command stream)
            xterm  Xterm Tektronix 4014 Mode
```

# Available Fonts

Additional installed Microsoft TrueType core fonts

```
Andale Mono
Arial Black
Arial (Bold, Italic, Bold Italic)
Comic Sans MS (Bold)
Courier New (Bold, Italic, Bold Italic)
Georgia (Bold, Italic, Bold Italic)
Impact
Times New Roman (Bold, Italic, Bold Italic)
Trebuchet (Bold, Italic, Bold Italic)
Verdana (Bold, Italic, Bold Italic)
Webdings
```