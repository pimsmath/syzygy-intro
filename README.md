# Syzygy Intro Site

This repository contains the hugo files for generating intro.syzygy.ca. The
repository contains one branche
  
  * master: All of the development files for building the site

Any changes committed to the master branch will trigger netlify to try to build
the tree. If `hugo` succeeds on Netlify the result will be published as the new version of the site. If `hugo` fails, the old version will be left in place.


## UPDATES

Just commit to the master branch and check (https://intro.syzygy.ca). If your
changes don't appear, check the status of the build with netlify.
