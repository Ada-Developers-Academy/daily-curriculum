# Fixing a Bug in Typo

The version of typo you have checked out contains a bug that prevents categories from being created or edited. To see this bug, make sure you are logged in as an administrator and click on the “categories” link on the left hand side of the admin page. The page is intended to look as follows:

![](https://courses.edx.org/asset-v1:BerkeleyX+CS169.2x+1T2016+type@asset+block/Screen_Shot_2013-11-04_at_4.41.05_PM.png)

This page is intended to allow you to add and edit blogging categories.

Start by checking that all of the existing Rspec and Cucumber tests run.

Then fix this bug by writing cucumber tests that fail when this bug is present, and then rspec unit tests that fail when the bug is present.  Then fix the bug, ensuring that your rspec unit tests pass, and that your cucumber tests pass. Write sufficient tests using the BDD-TDD cycle method such that ultimately the admin user can successfully edit existing categories and create new categories.

**Done!**
