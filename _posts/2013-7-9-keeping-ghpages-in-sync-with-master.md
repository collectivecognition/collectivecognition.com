---
layout: post
---
For simple, static web projects, you may simply want to keep your gh-pages branch in sync with the master branch.

It turns out this is exceedingly simple to do, adding only a few commands to your workflow.

First, while your master branch is checked out, make sure all of your changes are committed:

    git commit -a -m "Some changes"

Now, if you haven't already, create the gh-pages branch:

    git checkout -b gh-pages
    
If you've already got a branch set up, just switch to it

    git checkout gh-pages
    
The git `rebase` command lets you copy the contents of one branch to another:

    git rebase master
    
Now, push out the changes in both branches:

    git push --all
    
Make sure to switch back to the master branch when you're done:

    git checkout master
