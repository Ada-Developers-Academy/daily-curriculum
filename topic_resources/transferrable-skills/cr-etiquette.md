# Code Review Etiquette

Here are just a few notes (mostly my opinions) regarding code review etiquette.

1. Review all of your own code first. Check for:
  - Files that shouldn't be there (i.e. database file(s))
  - Files that aren't necessary (i.e. random whitespace changes that aren't related to your bug fix)
  - Code that isn't complete (i.e. another bug that you started fixing but haven't finished yet)
  - Commented out code that doesn't contribute to the goal of the feature/bug
2. Note that the person reviewing your code may be genuinely asking questions - not necessarily trying to question your methods
3. Expect the code review process to take time - probably more than you think it should
4. Switch to another mode of communication if there is too much back-and-forth within the code review tool
5. Sometimes code reviews require justifying _why_ you made the decisions you made, which is sometimes more work than writing the code itself
6. Note that sometimes the longer the code review takes, the greater change of merge conflicts as more code gets merged in
7. Every code review is an opportunity to learn something new! Try to frame this process as a _learning experience_ rather than a _personal judgement_. (Honestly, this is still really hard for me sometimes)
