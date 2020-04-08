---
date: 2018-01-22T15:10:23+07:00
title: "Teaching with Syzygy"
weight: 81
---

JupyterHub can be a great resource for teaching and we we encourage people to
use syzygy to help teach their classes, but you should keep the following
things in mind:

  * syzygy.ca hosts are *shared services*. Asking a large group of students to
    do the same task simultaneously may exhaust the available resources and make
    your experience very slow. When machines are under extreme resource
    pressure, they may decide to shutdown processes that they don't have any
    hope of servicing. Try to plan ahead by splitting up and spreading out
    tasks.

  * We have a very small support team. We try hard to make sure our services are
    always available, but we still have planned and unplanned outages. Normally
    we will try to resume the service as soon as possible, but this depends on
    lots of factors, and we can't always do it the same day.

For these reasons we recommend against using syzygy for e.g. Timed exams and we
urge you to be careful when planning submission dates for homework etc.

## Tools

### NBGitPuller
[NBGitPuller](https://github.com/data-8/nbgitpuller) is a very useful server
extension which uses specially constructed URLs to guide students through the
process of cloning out git repositories. As an example, an instructor might
maintain a collection of notebooks, which they will update and extend throughout
the term. By giving a specially constructed URL to their students, each student
will automatically be given their own copy of the files at the start of term and
can keep it in sync (without losing their changes) as the term progresses.


To use it, you need to construct long and complicated URLs, but fortunately
there is a handy [nbgitpull link
generator](https://jupyterhub.github.io/nbgitpuller/link) to help you. The
generator will ask for your JupyterHub server (use
`https://uxxx.syzygy.ca/jupyter/` where `uxxx is the name of your university), a
github repository, and (optionally) file you would like to open once the
repository has been cloned. After you fill all that information in, the
generator will produce a long complicated link which might look like...

```
https://uxxx.syzygy.ca/jupyter/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fpimsmath%2Fpublic-notebooks&urlpath=tree%2Fpublic-notebooks%2Fpath%2Fto%2Ffile.ipynb&branch=master
```

When the student visits the link for the first time the repository will be
cloned out into their home directory. When they visit the same link later in the
term git will "pull" in any changes from the repository and try to merge them
safely with the student's existing work (see below for more details of how the
merge works).


The strange characters in query string are HTML encoded versions of the familiar
ascii characters. For instance, `http://` becomes `http%3A%2F%2F`. It is
important that these values are properly encoded or they might be ignored by the
hub.  Some URL shortening services (e.g. bit.ly) will strip the encoding and may
break the links, so where possible please distribute the full (encoded) link
produced by the generator or use a shortening service which doesn't strip the
encoding (e.g. [tinyurl](https://tinyurl.com/)). The parameters in the query
string are...

  * **`repo=https:%3A%2F%2Fgithub.com%2Fpimsubc%2Fpublic-notebooks`** is required and
    specifies the URL of the git repository you want to clone.
  * **`branch=master`** is an optional git branch name (default "master")
  * **`urlpath=tree%2Fpublic-notebooks%2Fpath%2Fto%2Ffile.ipynb`** is an optional argument that specifies the path of the directory / notebook inside the repo to launch after cloning. By default, the base directory of the linked Git repository is opened. It's recommended that you specify a path to a specific file if you want that file to open after users click the link.

NBGitPuller is implemented as a notebook extension so doesn't depend on any
specific kernel. It will happily clone out *any* repository, so you can use it
with R, Python or any other kernel installed on your syzygy instance.

### nbgitpuller service demonstration

The following link demonstrates the nbgitpuller service on pims.syzygy.ca by
cloning out a [simple python3 example notebook](https://github.com/pimsmath/public-notebooks/blob/master/nbpuller-example1.ipynb).
To try the service out, simply click on the following link:

  * [nbgitpuller example](https://pims.syzygy.ca/jupyter/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fpimsmath%2Fpublic-notebooks&urlpath=tree%2Fpublic-notebooks%2Fnbpuller-example1.ipynb&branch=master) (You may want to open this in a new tab...)

Clicking on the link should trigger the following actions

  1. Take you to [pims.syzygy.ca](https://pims.syzygy.ca)
  2. Authenticate you via google (if you aren't already)
  3. Start your server (if it isn't already started)
  4. Clone out a copy of the notebook to
     `public-notebooks/nbpuller-example1.ipynb`
  5. Open the notebook in your browser.

The full URL used in the link is
```
https://pims.syzygy.ca/jupyter/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fpimsmath%2Fpublic-notebooks&urlpath=tree%2Fpublic-notebooks%2Fnbpuller-example1.ipynb&branch=master
```

Splitting this apart, we can see the pattern described above:

  * **`https://pims.syzygy.ca/jupyter/hub/user-redirect/git-pull`** refers to the
    syzygy instance (pims.syzygy.ca).
  * **`https%3A%2F%2Fgithub.com%2Fpimsmath%2Fpublic-notebooks`** tells nbpuller which
    repository to use (`https://github.com/pimsmath/public-notebooks`).
  * **`branch=master`** specifies the master branch within the repository.
  * **`urlpath=tree%2Fpublic-notebooks%2Fnbpuller-example1.ipynb`** tells nbpuller to open that file (`nbpuller-example1.ipynb`) automatically after cloning.


### How NBGitPuller Works

As its name implies, NBGitPuller works by constructing and executing git
commands. [Git](https://git-scm.com) is a distributed version control system
which lets you keep track of changes and merge them with other people's.  The
initial click on an NBGitPuller link will take the user to the relevant
JupyterHub, log them in (if necessary) then try to grab a clone of the
repository. If you're not familiar with git, this is essentially a copy of the
remote files in the repository with the advantage that both the user and the
repository owner can continue to modify their own copies of the files
then ultimately merge them together (inside the user's clone). To do all of this
NBGitPuller implements a subset of the git commands so that subsequent clicks on
a link by the user will try to merge changes according to this plan:


  * If content has changed in both places, prefer local (user) changes over remote
changes.
  * If a file was deleted locally but present in the remote, remote file is
restored to local repository. This allows users to get a 'fresh copy' of a file
by just deleting the file locally & clicking the link again.
  * If a file exists locally but is untracked by git (maybe someone uploaded it
manually), then rename the file, and pull in remote copy.

Since git is doing all of the heavy lifting here it is also possible to use git
directly to do more advanced tasks (e.g. different merging strategies) with the
caveat that mixing ordinary git commands and NBGitPuller is not a good idea.
Once you start using git "manually" for that repository you should avoid using
the NBGitPuller links as the merging patterns will almost certainly be
different. As the [NBGitPuller
documentation](https://github.com/data-8/nbgitpuller) says "[this] is going to
cause surprises on an ongoing basis, and should be avoided."
