---
date: 2017-10-19T17:56:50+07:00
title: "Troubleshooting"
weight: 80
---

From time to time you might experience problems with the syzygy.ca service. The
tips below may help you get things going again without further intervention, but
if not, please contact {{ Site.params.email }}

## Restarting your Server

Restarting your server can clear up a number of issues. If you see any of the
following messages, please try restarting your server.

 * `500 internal server error, permissi9n failure checking authorization, I may
   need a new token`

To restart your server, click on the Control panel button at the top right of
the notebook. This should display a page with a red "Stop My Server" button.
A few seconds after clicking the button, the red button should turn green and
say "My Server", click it again and you server should begin starting up again.
It can take around 30 seconds for your server to restart.

## Broken Configuration Files

Jupyter (and Python, and Julia ...) store configuration files in your home
directory, and from time to time these configuration files can become broken.
The simplest fix for this is to simply delete the configuration files and
revert back to the default configuration. In most cases the files are stored in
hidden directories (e.g. .local), and the trick is just knowing where they are,
here are some common ones

  * `~/.jupyter` - Jupyter Notebook configuration file
  * `~/.local` - Locally installed python packages (`pip --user install
    XXXX`)
  * `~/.julia` - Julia packages and configuration files.
  * `~/R` - R packages and configuration files.

{{< warning title="Be Careful" >}}
These files are unrecoverable once deleted
{{< /warning >}}

If you have determined that files in one or more of these locations is causing a
problem for you, you can delete them using the UNIX rm command. From inside a
notebook you can do e.g.

```shell
!rm ~/.jupyter/jupyter_notebook_config.py
```
Or from the terminal
```shell
rm ~/.jupyter/jupyter_notebook_config.py
```
Changes to the notebook configuration will only take effect once you restart
your server (see above).

## Out of Storage

The current default storage allocation for users is 1GB. If you find that you
are getting out of storage messages or are unable to save files, you may have
reached the quota. To recover from this, please email <jupyter@pims.math.ca> with
your username and the name of the server you are using.

## Missing Output

The notebook uses a tool called nbconvert to create PDF (and other) versions of
notebooks you have created for export. On some syzygy hosts when you run the
export, you will find that the output cells from your code are missing and you
can only see the input cells. This is because a `pre_save` hook is
being used on that server to scrub output before saving (or exporting)
notebooks. The reason for this is that it makes using git with notebooks much
simpler. If you decide that you would like to keep the output cells in your
notebook when saving, you can overrride this default by creating or modifying
the `~/.jupyter/jupyter_notebook_config.py` in your home directory.

From inside a python 3 notebook you could do
```shell
!mkdir -p ~/.jupyter
!echo "c.FileContentsManager.pre_save_hook = None" > ~/.jupyter/jupyter_notebook_config
```

The current pre_save hook looks like

```python
def scrub_output_pre_save(model, **kwargs):
    """scrub output before saving notebooks"""
    # only run on notebooks
    if model['type'] != 'notebook':
        return
    # only run on nbformat v4
    if model['content']['nbformat'] != 4:
        return

    for cell in model['content']['cells']:
        if cell['cell_type'] != 'code':
            continue
        cell['outputs'] = []
        cell['execution_count'] = None

c.FileContentsManager.pre_save_hook = scrub_output_pre_save
```

if you decide that you would like to scrub the output instead.
