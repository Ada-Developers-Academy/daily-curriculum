# Syncing a Fork: Getting Changes from Upstream

When we're working on our projects, requirements can change. Maybe I messed something up, or typo'd an important word. Maybe we're doing a project in waves and requirements are released in pieces. Regardless, it is not at all uncommon when working on a _forked_ repository to need to incorporate changes in the _master_ repository that happened after you forked it.

Here's how to do it:

1. First, make sure your local branch/repository is up to date. Commit or reset any outstanding changes so that `git status` reports a clean working directory. These instructions assume you're starting on your branch of your project fork (for me, that's `jnf/master`).
1. Get the clone url for the project master. I'll use `git@github.com:Ada-Developers-Academy/C3Projects--SinatraSite.git` in this example
1. On your project fork, you'll need to add a new _remote_ called 'upstream':
  - `$ git remote add upstream git@github.com:Ada-Developers-Academy/C3Projects--SinatraSite.git`
1. Then fetch the upstream changes. If lots has changed (like, say, 23 of your classmates pushing a bunch of html and images up to git), then this may take a couple of minutes. This command tells git to fetch changes just for the remote you called 'upstream'. It doesn't merge any of those changes yet.
  - `$ git fetch upstream`
1. Switch to the branch where you want changes to be merged. Most of the time, for us, this will be master.
  - `$ git checkout master`
1. Merge the changes from upstream's master into your master. Unless you've made changes to the master branch on your fork, this should be a seamless merge:
  - `$ git merge upstream/master`
1. Now your fork's master branch is synced with the remote, all that's left to do is update your branch. Switch back to your branch:
  - `$ git checkout jnf/master`
1. Now merge in master. This will _almost certainly_ trigger a merge commit and that's totes ok. Merge commits are useful and let us know when outside code entered our project:
  - `$ git merge master`
1. Push your merged code up to github:
  - `$ git push`
