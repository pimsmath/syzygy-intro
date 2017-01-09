# Syzygy Intro Site

This repository contains the hugo files for generating intro.syzygy.ca. The
repository contains two branches
  
  * master: All of the development files for building the site
  * gh-pages: The rendered html/css/js files and nothing else

The intention is that you should be able to mostly ignore the gh-pages branch
and just concentrate on making changes in the master branch. The deploy.sh
script and the steps outlined below should then take care of updating the
gh-pages. To do this, we have implemented the steps in this [blog
post](https://gohugo.io/tutorials/github-pages-blog/), with the public directory
containing a git subtree with the gh-pages branch.


## UPDATES

Updates to the site should be made in the master branch. A typical workflow
might look like

  1. Edit markdown files under ./content
  2. Run `hugo server` and check the changes at http://localhost:1313
  3. Run the ./deploy.sh script to commit changes and push them to github

Step 3 combines a few steps into one, it should

  a. Run `hugo` to update the contents of the ./public directory
  b. `git commit -A` your changes on the master branch
  c. push the master branch to github
  d. push the gh-pages branch (./public directory) to github

Once the last step is completed the changes should be publicly visible on
intro.syzygy.ca.
