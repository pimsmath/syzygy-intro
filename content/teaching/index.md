---
date: 2018-01-9T13:10:23+07:00
title: "Teaching with Syzygy"
weight: 81
---

JupyterHub can be a great resource for teaching and we we encourage people to
use syzygy to help with teach their classes, but you should keep the following
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

For these reasons we recommend against using syzygy for e.g. timed exams and we
urge you to be careful when planning submission dates for homework etc.

## Tools

### NBGitPuller
[NBGitPuller](https://github.com/data-8/nbgitpuller) is a very useful server
extension which uses specially constructed URLs to allow students to be guided
through the process of cloning out git repositories. As an example, an
instructor might maintain a collection of notebooks for their class, which they
will update and extend through the term. By giving a specially constructed URL
to their students, each student will automatically be given their own copy of
the files at the start of term and can keep it in sync (without losing their
changes) as the term progresses.


We are in the process of rolling out this extension and making it available by
default on all of our hubs so it is probably already installed and activated on
your syzygy.ca instance, or it will be soon. To use it you need to construct
URLs which specify the, repository you want to interact with. The URL will look
something like 
```http
https://uxxx.syzygy.ca/jupyter/hub/user-redirect/git-pull?repo=https://github.com/data-8/materials-fa17
```

  * **repo** is the URL of the git repository you want to clone. This parameter
    is required.
  * **branch** (optional) is the branch name to use when cloning from the repository. This
    parameter is optional and defaults to master.
  * **subPath** (optional) is the path of the directory / notebook inside the
    repo to launch after cloning. This parameter is optional, and defaults to
    opening the base directory of the linked Git repository.

The functionality is implemented as a notebook extension so doesn't depend on
any specific kernel, the URLs will happily clone out *any* repository R,
javascript, ...

### How NBGitPuller

As its name implies, NBGitPuller works by constructing and executing git
commands. [Git](https://git-scm.com) is a distributed version control system
which lets you keep track of changes and merge them with other people's.  The
initial click on an NBGitPuller link will take the user to the relevant
JupyterHub, log them in (if necessary) then try to grab a clone of the
repository. If you're not familiar with git, this is essentially a copy of the
remote files in the repository with the advantage that both the user and the
repository owner can continue to modify their own copies of the files
then ultimately merge them together (in the user's clone). To do all of this
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
