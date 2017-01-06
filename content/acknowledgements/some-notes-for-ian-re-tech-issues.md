---
date: 2017-01-05T15:18:00-08:00
title: "Notes for Ian"
weight: 500
---

##1. 
On ubc.syzygy.ca, in Python 3, when I load in matplotlib, it takes too long as it builds fonts and such. Here is the warning I get:


```
/opt/conda/lib/python3.5/site-packages/matplotlib/font_manager.py:273: UserWarning: Matplotlib is building the font cache using fc-list. This may take a moment.
  warnings.warn('Matplotlib is building the font cache using fc-list. This may take a moment.')
/opt/conda/lib/python3.5/site-packages/matplotlib/font_manager.py:273: UserWarning: Matplotlib is building the font cache using fc-list. This may take a moment.
  warnings.warn('Matplotlib is building the font cache using fc-list. This may take a moment.')
```


## 2. 
In my file AnimatedPlots.ipyth, the code works fine on ubc.syzygy.ca but fails on mybinder.org
It seems it cannot find the animator code there. Error message is this:



```
HTML(anim.to_html5_video())

---------------------------------------------------------------------------
RuntimeError                              Traceback (most recent call last)
<ipython-input-6-5114ccf53b4c> in <module>()
----> 1 HTML(anim.to_html5_video())

/home/main/anaconda2/envs/python3/lib/python3.5/site-packages/matplotlib/animation.py in to_html5_video(self)
    977                 # We create a writer manually so that we can get the
    978                 # appropriate size for the tag
--> 979                 Writer = writers[rcParams['animation.writer']]
    980                 writer = Writer(codec='h264',
    981                                 bitrate=rcParams['animation.bitrate'],

/home/main/anaconda2/envs/python3/lib/python3.5/site-packages/matplotlib/animation.py in __getitem__(self, name)
     87     def __getitem__(self, name):
     88         if not self.avail:
---> 89             raise RuntimeError("No MovieWriters available!")
     90         return self.avail[name]
     91 

RuntimeError: No MovieWriters available!
```


