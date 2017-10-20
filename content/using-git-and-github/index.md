---
date: 2016-03-09T19:56:50+01:00
title: "Using Git and GitHub"
weight: 70
---
## Using Git and Github

**Git** is a Unix command used for sharing code and other computer files with
colleagues. 

**Github** is a popular place on the web to store your code and other computer
files, either privately or for the whole world to see. These collections are
organized into units (like folders) called repositories. 

**Git** is also used for version control when working on a large computer
project, where you need to keep track of changes in many different files,
possibly written by many different people. Because **Git** can be used for very
complex projects, it is a very powerful tool.

Let's keep things simple here. The author of this book has a public **Github**
site, which has many repositories that he has created for various purposes. You
are welcome to look at his public site here: https://github.com/mlamoureux

There is a repository for the source code written for this eBook, you can look
at it here: https://github.com/mlamoureux/UsingSyzygy

To make a copy of this repository on your syzygy.ca account, simply open a new
Notebook (say, in Python) and enter the following commands:

```python
!git clone https://github.com/mlamoureux/UsingSyzygy.git 
```

This will make a new folder on your Jupyter Hub called "UsingSyzygy" that will
have all the code inside that folder. You can now open those files and run the
code in your server.


Now, as you get more experience with **Git** and **Github**, you might like to
clone some other people's repositories and use their code. It is a good idea to
keep your account organized, so you can create a new folder, and clone the
new stuff directly into that new folder. A series of Notebook commands to do
this would look like this:

```python
%mkdir MyNewDirectory 
```

```python
%cd MyNewDirectory
```

```shell
!git clone https://github.com/THE-USER-NAME/THE-REPOSITORY-NAME.git 
```

You can find THE-USER-NAME and THE-REPOSITORY-NAME.git right on **Github** when
you are looking at someone's repository. There is a button on the right, that
says "Clone or download." Click on "Clone or download" and request a "Clone with
HTTPS." You will then get the https address for the repo, which you can paste
into the **git clone** command above.

Of course, you can also do this in a terminal window (by opening "New Terminal"
in the front page of your Jupyter server). But frankly, I hate the Unix terminal
and its command line, so I would naturally advise you to be like me and just
avoid Unix.  Use the Notebook directly. :-)

Some details on cloning **Github** repos are here:
https://help.github.com/articles/cloning-a-repository/

IMPORTANT NOTE: If you are cloning from a PRIVATE repo on **Github** you will
need to do it from the Unix terminal, as the server will ask you for a username
and password (to ensure that you really have access to that private repo).
