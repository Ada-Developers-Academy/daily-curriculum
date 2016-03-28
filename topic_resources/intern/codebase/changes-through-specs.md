# Changes Through Specs

Starting with scenarios 1 and 2 in the previous page, you should create cucumber tests to drive the code changes to implement each scenario. The second one will be toughest, because you will have to create the basic functionality that allows merging to happen. Subsequent specs will be easier, as you start adding specs and code to meet the criteria spelled out in scenarios 3-4. You should put your cucumber tests in a new file.

For scenarios 1 and 2:

* Start by implementing the step definitions that will show an admin (but not a regular user) a "Merge With This Article" button which, when clicked, will dispatch to a controller action that does the merge.

* Let those step definitions drive the creation of controller specs.  The merging functionality itself should go in the model, not the controller, so feel free to assume an instance method of the Article model merge_with(other_article_id).  Eventually, this method will return an article object that is the merged article, and also handles all of the considerations above. Get these specs to pass green.  Commit.

**Warning**: ActiveRecord caches associations. If you load an article from the database, reassign its comments to some other article, then destroy the first article, the comments may be destroyed as well even if the actual database says that the article doesn’t own the comments anymore. This is because at the time the article was originally read from the database, the knowledge about which comments that article owned was read as well (cached), and this knowledge was not updated when the comments were reassigned nor when the article was destroyed.

When you are finished, you should have the following:
* Typo passing green all specs
* Specs to verify that the controller behaves correctly when non-admins attempt to merge articles passing green.
* Specs to verify that the model’s merge method combines the given articles correctly passing green.
* Modifications to the models, views, and controllers necessary to merge articles
* Cucumber scenarios "A non-admin cannot merge two articles" and “When articles are merged, the merged article should contain the text of both previous articles” passing green
* All the above committed to your local Git and pushed to Heroku

**Done!**
