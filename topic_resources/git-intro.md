# ￼Intro to Git

## Version Control
Git is a "distributed version control" system:
- Distributed - used in opposition to Centralized. This means that there is no single "correct" computer for the source code to exist upon. Each person who uses or writes the code will have their own copy, with any changes that they want.
- Version - This refers to the idea that source code files change over time. When you save a file, that is a single version of the file. When you add a new line of code and save it again, that is a new version of the file.
- Control - The Git system is used to control or manage the process of creating new Versions of source code files, and the process of distributing those versions to other people.

## But Why???
Version Control is used in software development because we have multiple people working together to build a single project, and we need to coordinate that process of working together to ensure it is reliable and efficient.
While most of our work until now has been individual, it's important to also recognize that the "multiple people" in the above statement may also refer to you and yourself *in the future*.

As an analogy, it might help to consider the case of a group of artists working on a gigantic mural. To ensure that the overall design and intention of the mural is achieved, the artists must coordinate amongst themselves to avoid painting over each others' work. A similar dynamic exists for multiple programmers working on a set of files for a programming project.

## Lets Git Started!
### Creating a repository
With Git, a collection of files, and all of the versions of those files, are called a "repository" or "repo" for short. Before Git can start "tracking" the different versions of your files, we need to create that repository:

```bash
$ mkdir my-repo
$ cd my-repo
$ git init
Initialized empty Git repository in /Users/.../my-repo/.git/
```

When you create a repository it starts empty -- there are no files and no versions tracked within it. We can see this by using a command to view the current `status` of our repository:

```bash
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

### Putting files into Git
Great! Now that we have a repository, we need to add some files into it. Lets first create a file so we have something to work with.

```bash
$ echo "This is a file!" > first-file.txt
```

After that we can `add` the file, which prepares it to be put into the repository.

```bash
$ git add first-file.txt
```

Now that we have "staged" the file `first-file.txt` with the `git add` command, we can again use `git status` to check on our repository:

```bash
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

          new file:   first-file.txt
```

Here we see that Git is telling us we have a pending change to the repository -- adding a new file named `first-file.txt`. However, that change is not yet part of the repository! We can affirm to Git that we really want to do make this change by using `commit`:

```bash
$ git commit -m "Add first-file.txt"
[master (root-commit) e88b5ce] Add first-file.txt
 1 file changed, 1 insertion(+)
  create mode 100644 first-file.txt
```
Note: Your computer may say something different for the `e88b5ce` part.

The reason we used the `-m "Add first-file.txt"` option for the `git commit` command is because Git is a real stickler about documenting all of your changes!

When you `commit` a change, Git requires that you explain yourself. This is highly important, as it will help other people (and your future self!) understand what changes you made without having to read the complete details.

### Viewing your history in Git
Now that we've committed a change to Git we can take a look at the history of our repository, which shows all of the changes that have been committed, in reverse chronological order:

```bash
$ git log
commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```
Note: Your history will likely show a different commit number (or commit "hash"), author name, and date.

Since we've only made a single commit so far, the `log` only shows a single entry. As we make more changes and commit them into the repository, we'll get more entries. Lets try that now!

```bash
$ echo "This is a second file!" > second-file.txt
$ git add second-file.txt
$ git commit -m "Add another file"
[master 475047a] Add another file
 1 file changed, 1 insertion(+)
  create mode 100644 second-file.txt

$ git status
On branch master
nothing to commit, working directory clean

$ git log
commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

Now we have two entries in the history of our Git repo! These entries are generally known as "commits", because you use the `commit` command to create them. Also, notice that the `git status` command says "nothing to commit, working directory clean". This message indicates that Git doesn't see any pending changes at this time -- because we just committed those changes!

### Updating files with Git
So far, we've created two commits by adding a new file two times. Lets try changing one of these existing files, instead.

```bash
$ echo "This is the new file content!" > first-file.txt
$ git add first-file.txt
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   first-file.txt

$ git commit -m "Update first-file.txt with new content"
[master 474d3fe] Update first-file.txt with new content
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git status
On branch master
nothing to commit, working directory clean

$ git log
commit 474d3fe29d17add79937cb94370d2f94fbde1705
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:40:07 2015 -0700

    Update first-file.txt with new content

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

This process looks pretty similar to the previous one in which we added `second-file.txt`. The only important differences are where Git is telling us about the change that we're making:
- `modified:   first-file.txt`
- `1 file changed, 1 insertion(+), 1 deletion(-)`

With these two lines Git is showing us first what file we have modified in our pending change, before we commit it. And second (after we commit it), what the actual modification to that file was -- we removed one line (the original "This is a file!"), and added one line (the new "This is the new file content!").

### Time travelling with Git
By updating `first-file.txt` and committing that update to Git, we have created two versions of the file. This is helpful because we can, if necessary, *time travel into the past* and gain access to previous versions of our files. Let's check that out now!

```bash
$ git checkout -b bttf master~1
Switched to a new branch 'bttf'

$ git log
commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt

$ cat first-file.txt
This is a file!
```

The `git checkout` command, and "branches", are concepts that we'll get into in more detail later. For now, take a look at the output of `git log` -- it no longer includes the most recent entry for "Update first-file.txt with new content"! And indeed, when we look at the text inside of `first-file.txt` we see that it has the original line "This is a file!".

We have effectively travelled back in time to before we made our most recent change. But don't worry, Git remembers everything we've ever done (it can be very discrete, though). If we want to look at the most recent version again, we can do so:

```bash
$ git checkout master
Switched to branch 'master'

$ git log
commit 474d3fe29d17add79937cb94370d2f94fbde1705
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:40:07 2015 -0700

    Update first-file.txt with new content

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt

$ cat first-file.txt
This is the new file content!
```

... And we're right back to where we had been, nothing was lost. This is the fundamental power of Git (and version control in general). We can make changes to files, save those changes, undo them later, and then even undo that undo!

### Time is a tree, not a line
(or a flat circle...)

With Git, the concept of time is represented by the history of changes that we can look at with `git log` -- rather than moving forward at 60 seconds per minute, time only advances when a new change is committed to the repository.

The `log` command shows us a "linear" history, where each change happens before and after a single other change. However, this is only one view of the entire timeline... there are other possible histories and we can see them and move between them using "branches".

Each branch represents a particular, linear history of changes (the `log` command shows us the history for a particular branch). We've already created two branches:
- 'master' is the default branch that is created when you make a new repo with `git init`.
- 'bttf' is another branch that we created with the `git checkout -b bttf` command.

We can look at the histories of these two branches using the `log` command:
```bash
$ git log master
commit 474d3fe29d17add79937cb94370d2f94fbde1705
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:40:07 2015 -0700

    Update first-file.txt with new content

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt

$ git log bttf
commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

As you can see, the bttf branch has a different history from the master branch -- it's missing the most recent commit. We used these two branches to move back and forth in time, with the `git checkout` command. `git checkout [branch]` is used to tell Git to make all of your files use the most recent versions in the branch you specify.

With the two branches we have in this example, switching between them is equivalent to moving forward by one change, or backwards by one change. This is because the 'master' branch's history includes everything in the 'bttf' branch's history.

But this isn't the only way for branches to work! In fact, branches can have "diverging" histories -- where two branches each include changes that the other branch does not have. One way to achieve this is by committing *different* changes after a particular commit, than what the other branch's history has after that change:

```bash
$ git checkout bttf
$ echo "Biff says 'Have a nice trip, see you next winter'" > first-file.txt
$ git add first-file.txt
$ git commit -m "Add Biff Tannen quote"
$ git log bttf
commit c0fb6d52ffe388ec1595d4edac9db3132a2f5e21
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 10:44:16 2015 -0700

    Add Biff Tannen quote

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt

$ git log master
commit 474d3fe29d17add79937cb94370d2f94fbde1705
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:40:07 2015 -0700

    Update first-file.txt with new content

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

Now we can see that the 'bttf' branch goes from the "Add another file" change (475047...) to the "Add Biff Tannen quote" change (c0fb6d...), but the 'master' branch goes from "Add another file" to the "Update first-file.txt with new content" change (474d3f...)!

This ability to have diverging histories is the reason we use the term "branches". You can think of each history as like a branch on a tree. Each branch on the tree starts from the same trunk (known in Git as the "root"), but at some point the branches grow out from the trunk at different points, and smaller branches grow out from them.

We can still use `git checkout` to move between the 'master' and 'bttf' branches, just as we did when the 'master' branch had the entirety of the 'bttf' branch's history.
