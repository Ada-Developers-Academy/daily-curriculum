## Code Reviewing for Ada

###1. Join Code Reviewers group for C5
  * If you're not sure if you're in the Code Reviewers group for C5, you should go to [https://github.com/Ada-C5](https://github.com/Ada-C5) to accept your invite.

###2. New Code Reviewing Process
  * Two 'kinds' of review comments:
    * **Critical** comments are those intended to inform reviewee about functional changes that would improve code (readbility, logic, DRYness, etc.) or warn of potential pitfalls
    * **Supportive** comments are mainly an expression of your positive feelings when reading through the code
  * Because it takes significantly longer to write up a good critical comment, and because many projects will have the same issues, we're going to treat them differently.
    Please keep track of the **file** and **line number** for each place where you'd make such a comment and then notify Charles of it with a brief (one sentence) description of what your
    comment will be.

    I will then aggregate all of this information and consolidate it into a list of major review "themes" for Jeremy to discuss in class. I might also copy a more
    thorough version of each comment into each PR. If a comment is unique to that particular student/team I will also put it into the PR, so that it doesn't get missed.
  * I want to emphasize again using brevity in describing the comment you would make, I've found that the majority of time spent when reviewing PRs comes from trying to find
    the best way to completely describe what changes should be made, and why. Putting that effort in directly in the middle of a review slows the whole process down a fair bit
    and is duplicated effort if everyone else is also spending a while trying to come up with the same advice. Just send Charles a short line about what you saw that deserves a comment.
  * For supportive comments, I've found these are a lot easier to write so please do write them directly into the PRs!

###3. General Reviewing Instructions
  1. Go to [Code Reviewer wiki](http://adadevelopersacademy.wiki/Code_Reviewer) and find latest project
  1. Open the Pull Requests page and filter the list by 'Everything assigned to you'
  1. Select a PR and read the comment from the submitter
  1. Click on 'Files changed' to the end result of all changes in the PR. (Viewing by commit can sometimes make it easier to understand what the coder was doing, but you
     then must check if they've changed that code in a later commit before commenting).
  1. Browse through most of the files listed. In Rails projects you can probably skip some of the unmodified/boilerplate files:
    * `bin/`
    * Various files in `config/`
    * `db/schema.rb`
    * `lib/tasks/`
    * `Gemfile` and `Gemfile.lock`
  1. When you see a line or section of code that you'd make a comment upon, do one of two things:
    * For critical comments, click on the _line number_ to highlight that line. Then copy the URL from your browser and save it in a text file or Slack it to Charles.
    * For supportive comments, click on the blue + button that shows up when you mouse over the line. A comment entry box will open for you to add your comment in Markdown.
  1. When you've finished reviewing all of the files, you can make a comment on the overall PR by clicking on 'Conversation' at the top of the page and using the comment entry
     box at the very bottom of the page.

###4. Examples!!
