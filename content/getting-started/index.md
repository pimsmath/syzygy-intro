---
date: 2016-03-09T19:56:50+01:00
title: "Getting Started"
weight: 20
---

We quickly show you how to log in, and a few other pointers. 

Click on the subsections to read further. 


## Logging In, and Browsers.

<img src="/img/sfu-jupyter.png" alt="SFU login" 
	width =300" align = "right">


Log into the syzygy service by using your home university credentials or Google
credentials. Currently, the following sites are up and running:

* [https://sfu.syzygy.ca](https://sfu.syzygy.ca) Simon Fraser University
* [https://ubc.syzygy.ca](https://ubc.syzygy.ca) University of British Columbia
* [https://ucalgary.syzygy.ca](https://ucalgary.syzygy.ca) University of
  Calgary
* [https://uleth.syzygy.ca](https://uleth.syzygy.ca) University of Lethbridge
* [https://usask.syzygy.ca](https://usask.syzygy.ca) University of Saskatchewan
* [https://utoronto.syzygy.ca](https://utoronto.syzygy.ca) University of Toronto
* [https://uvic.syzygy.ca](https://uvic.syzygy.ca) University of Victoria
* [https://uwaterloo.syzygy.ca](https://uwaterloo.syzygy.ca) University of Waterloo
* [https://cybera.syzygy.ca](https://cybera.syzygy.ca) Cybera (via Google Authentication)
* [https://cybera.syzygy.ca](https://pims.syzygy.ca) PIMS (via Google Authentication)

Your "university credentials" will be something like your campus-wide login ID,
student or employee number, etc. You will also need to enter the password
connected to your campus-wide login ID or number. This information is held
privately by your university IT group, so privacy is assured by your university. 

Anyone with Google credentials can use
[https://cybera.syzygy.ca](https://cybera.syzygy.ca) or
[https://pims.syzygy.ca](https://pims.syzygy.ca) for research, learning or
innovation (including post secondary institutions, K-12 and business
incubators).

You can use any web browser that you like. However, some experience suggests the following:
- Firefox is better at rendering math formulas, but cut/copy/paste does not work in the terminal.
- Chrome is better at cut/copy/paste in the terminal, important when using GIT, for instance.
- Safari works fine, including on iPads and iPhones.
- Internet Explorer is not something to use, for many good reasons. 

Code samples for the book can also be launched on Binder: [![Binder](http://mybinder.org/badge.svg)](http://mybinder.org:/repo/mlamoureux/usingsyzygy)

## Notebooks, terminals and Unix

Once you've logged in, the syzygy service will start a **server** for you, which
is the computing service you are accessing. (If it doesn't start automatically,
click on the "Start Server" button.) Once the server is running, you will be
presented with a list of files and folders that exist in your account. This is
called the Hub, and is a view like the Finder on a Mac, or the File Explorer on
a Windows computer. 

From this Hub, you can click on files and folders to open them, you can select
them and take actions like renaming them, duplicating them, or removing them.
Some of the files will have the suffix .ipynb, which stands for "iPython
Notebook." Despite the name, the Notebook might have nothing to do with Python
-- it is there for historical reasons. 

Notebooks are files containing formatted text, math formulas, and computer code.
Most of the time you will be creating and working with Notebooks in syzygy,
Each Notebook has a collection of cells, which you create, edit and run. 

So keep this as your focus for your work -- you will work in Notebooks, and you
will create pieces of text, math, and code to use. 

However, sometimes you need to know that in the background of the Jupyter Hub is
a Unix machine that does all the work. In the PIMS case, this is running on
hardware from Compute Canada, or Cybera.

To access the Unix shell, you can open a terminal from the Hub, and do all the
usual Unix bash shell operations. You can't access superuser commands (sudo,
etc.) but you can do just about everything else you like in Unix. If you are an
experienced Unix user, feel free to open a terminal and browse around. 

Personally, I try to avoid using the Unix shell, but there are times when it is
a must. (For instance, to install certain packages, or to access files on Github
or on remote machinces.) There are notes on how to do this later in this book. 

## Moving files around

At some point you will want to reorganize the many files and folders you have in
your Jupyter Hub.

If you like Unix, you can always open a new terminal and move files around using
the "mv" or "cp" commands. 

If you want to avoid Unix, you can use the  Hub's naming system to move files around. 

Select a file in the Hub by clicking on the square box at the left of the file's
name. You are then given the option to "rename" the file. Click on the rename
button, and then enter one of the following:
- newname  -- to give the file the new name
- ../oldname -- to move the file up and out of the current folder, into the
  previous forlder
- foldername/oldname -- to move the file into the folder called "foldername."
  This folder should already exist (because you created it earlier with a "new
  folder" command).

These renaming methods also work to move folders and their contents.

To move across several branches in the directory tree, you need to know the full
path name of your files and where they are to go. This means you need to find
out the name of your root tree structure. A fast way to do this is to use the
magic command %cd in a notebook.

Open a notebook, click on an empty cell, and type %cd, hit shift-return. It will
return the director root name. Typically something like `/home/username` or
`/home/usernumber`.

You can now use this to move a file into any folder. Just rename the file
something like `/home/username/folderA/filename`. (the folderA better exist
already, for you to move something into this.)



See the [Unix Tricks](/unix-tricks/) section on Unix magic for more tips on
moving files.
