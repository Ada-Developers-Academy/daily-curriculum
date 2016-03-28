# Legacy Code Refactoring and Bug Fix

**Overview: Extending & Fixing Typo**

Typo is a blogging engine written in Rails to allow people to set up a blog easily.  Typo consists of about 30,000 lines of code (30 KLOC) and comes with a ton of features, including authentication to post to the blog, attaching files to articles, adding special markup, creating custom themes, building user profiles, and allowing guests and/or users to comment on posts.  It also supports more advanced features like trackbacks (allowing other blogs to “track back” to yours and mention you in their blog article).

From your perspective, Typo is legacy code since you didn't write it yourself :-)  In this assignment you'll go through the steps of adapting the BDD+TDD cycle to fix a bug in a piece of legacy code.

**Note:** Assume that the documents you are given are the latest and greatest for a given system. They may not all be correct. If someone doesn't work, don't be surprised, just figure out how to fix it!

## Assignment Structure:

1. Get the legacy software running, kick the tires (play around with Typo yourself), and make sure its existing test suite runs correctly, to establish a baseline.
2. Examine the bug in typo.
3. Write cucumber stories to test the behavior of the bug.
4. Write a bugfix that passes the cucumber stories you created in step 3.

Next: [Getting Set Up](setup.md)
