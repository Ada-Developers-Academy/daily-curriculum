# How To Turn In Your Projects

This is a step-by-step guide describing the git workflow we'll be using for every project that's assessed against a rubric. It involves both _cloning_ and _forking_ the project repo. In short, you will _clone_ the project repo, then create and _push_ a new branch that represents where your project will live when it is complete. Then you will _fork_ the project and code against the forked version of the branch you pushed to the project master. When you are ready for your code to be reviewed, you will _open a Pull Request_ to _merge_ your forked branch back into your branch on the project master.

Here's the detailed, step-by-step, version, using __Solar System__ as an example.

### Part 1: Setting up your space in the project master
- I recommend you separate your _cloned_ project masters from your _forked_ working copies
  - Go into your project folder (I keep mine in `~/projects/Ada/`): `$ cd ~/projects/Ada/`
  - If you don't have one, make a directory for your _cloned_ project masters: `$ mkdir project-masters`
  - If you don't have one, make a directory for your _cloned-and-forked_ working copies: `$ mkdir project-forks`
- [ ] `cd` into your project masters folder: `$ cd ~/projects/Ada/project-masters` ![`cd` into your project masters folder](project-masters.png)
- [ ] Find the url for _cloning_ the repo on its Github page: ![Find the Clone URL button](clone-url-button.png)
- [ ] Clone the project master repo: `$ git clone git@github.com:Ada-Developers-Academy/C3Projects--SolarSystem.git` ![Clone the project repo](clone-project-master.png)
- [ ] `cd` into the cloned repo directory: `$ cd C3Projects--SolarSystem/` ![cd into your cloned project](cd-solar-system.png)
- [ ] __CRITICAL__ Checkout a new local branch, with your initials in the branch name: `$ git checkout -b jnf/master` ![Checkout new local branch](checkout-jnf-master.png)
- [ ] Open the project directory in your editor: `$ subl .` or `$ atom .`
- [ ] Open `RUBRIC.md`, then edit the first line to include your name: ![Add name to Rubric](name-in-rubric.png)
- [ ] `$ git status` should report that you have a file change to commit: ![Change to Rubric](git-status-rubric.png)
- [ ] Commit the changed rubric to your local branch: `$ git commit RUBRIC.md -m "Added my name to the rubric."` ![Commit rubric changes](commit-name-to-rubric.png)
- [ ] Push your changes upstream to Github.: `$ git push -u origin jnf/master` ![Push your branch upstream](push-branch-upstream.png)

### Part 2: Forking the project to create your own working version
- [ ] Go back to the Github page for the project, then _fork_ the project to your Github account: ![Fork the project](fork-the-project.png)
- [ ] `cd` to your forked-project directory: `$ cd ~/projects/Ada/project-forks/` ![Go to your project forks](project-forks.png)
- [ ] Find the URL to _clone_ your _fork_: ![Clone your fork](button-for-cloning-fork.png)
- [ ] _Clone_ your fork: `$ git clone git@github.com:jnf/C3Projects--SolarSystem.git` ![Clone your fork](clone-your-fork.png)
- [ ] `cd` into your cloned project: `$ cd C3Projects--SolarSystem/` ![cd into clone](cd-into-clone.png)
- [ ] __CRITICAL__ Switch to your local branch; it already exists because it was part of the source project that you _forked_ and then _cloned_. `$ git checkout jnf/master` ![Switch to your branch](switch-to-your-branch.png)
- Open your editor here! `$ subl .` or `$ atom .`
- __Complete your project. Create files, write code, stage and commit files.__ See [Git Immersion](http://gitimmersion.com/index.html) for help with using Git to stage, commit, and push your code to your _fork_ on Github.

### Part 3: Submitting your work for review via Pull Request
- When you're ready for code review, make sure that all of your code has been committed and pushed to your _fork_ of the project.

## Workflow Diagram

This diagram shows the entire workflow, but condenses some of the steps listed above. I've included it here for reference and clarity, but use the steps above to guarantee your projects are submitted correctly. ![Git workflow diagram](project-turn-in-workflow.png)

