# Legacy Code Refactoring and New Feature

**Overview: Extending & Fixing Typo**

Typo is a blogging engine written in Rails to allow people to set up a blog easily.  Typo consists of about 30,000 lines of code (30 KLOC) and comes with a ton of features, including authentication to post to the blog, attaching files to articles, adding special markup, creating custom themes, building user profiles, and allowing guests and/or users to comment on posts.  It also supports more advanced features like trackbacks (allowing other blogs to “track back” to yours and mention you in their blog article).

From your perspective, Typo is legacy code since you didn't write it yourself :-)  In this assignment you'll go through the steps of adapting the BDD+TDD cycle to enhance a piece of legacy code.

## Assignment Structure:

0. You should already have the legacy software running, with all the tests passing from the bug fix portion.
1. Specify the feature.
2. Drive changes through writing specs.

Next: [Specify Feature](specify-feature.md)
