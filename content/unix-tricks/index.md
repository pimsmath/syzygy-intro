---
date: 2016-03-09T19:56:50+01:00
title: "Unix Tricks"
weight: 60
---

## Unix tricks

In the background, Jupyter Hub runs on Unix, and you can access the Unix bash shell to do all your Unix magic from the command line. Just open a new "terminal" from the front page of your Jupyter server.

However, I am not a big Unix fan. I prefer to point and click. So here are a few tricks I've learned to avoid the terminal commands.


## Unix and Magic in a Notebook.

While running a Jupyter Notebook, you can access many Unix commands directly, without opening a terminal window. 

These are called "magic" commands and always start with the percent sign %.

Here are a few familiar Unix commands you might find useful:

- %ls -- to list all files in the current directory
- %cd -- to see the name of your current directory
- %cd dirname - to change directory (enter the name of the directory you want)
- %cp oldfile newfile -- to copy the oldfile onto a newfile
- %rm filename -- to remove (delete) the file named "filename"

Thankfully, you can move all around the directory tree using these magic commands. So for instance, you might want to copy a file from Directory1 into Directory2. You would use a command like this:
- %cp /home/myusername/Directory1/filename /home/myusername/Directory2/filename 

Where "myusername" is whatever the Jupyter server has called your account. Use the %cd command to see the path name that includes your user name.

To see all possible magic commands available in a Jupyter notebook, type the (magic) command
- %lsmagic

With a double percentage sign %% you signal to Jupyter that the whole cell is to be interpreted accordingly. For instance a cell like this:


```python
%%latex
\[ \int_0^1 f(x) \,dx = F(1) - F(0) \]
```
tells the notebook to read the whole cell as latex code, and render it accordingly.

A good reference to what all these magic commands can do is here: https://ipython.org/ipython-doc/3/interactive/magics.html


## Magic in a Notebook

In the last section, we discussed how to access Unix commands from the Jupyter Notebook. The keyis to use "magic" commands, that start with a percentage sign %.

There are many more magic commands available. To see all possible magic commands available in a Jupyter notebook, type the (magic) command
- %lsmagic

A good reference to what all these magic commands can do is here: https://ipython.org/ipython-doc/3/interactive/magics.html


With a double percentage sign %% you signal to Jupyter that the whole cell is to be interpreted accordingly. For instance a cell like this:


```python
%%latex
\[ \int_0^1 f(x) \,dx = F(1) - F(0) \]
```
tells the notebook to read the whole cell as latex code, and render it accordingly.

There are similar commands for creating cells with HTML code, Ruby, Perl, JavaScript, etc etc. 

(Maybe I will give a few examples here too.)


