##TDD
- Test First Development
- Test Driven Development
- Behavior Driven Development
- Growing Object Oriented Software, Guided by Tests (which is actually a book title)

Test-driven development is a programming technique that requires you to write actual code and automated test code simultaneously. This ensures that you test your code—and enables you to retest your code quickly and easily, since it's automated.

(1) Write a test that describes some new feature of the software. Run the test, and watch it fail. (Watching it fail is crucial!) (2) Write code that makes all the tests pass. (3) Look for opportunities to simplify your code.

- Write a test
- Watch it fail
- Make it pass
- Simplify
- Repeat

You'll often hear this cycle shorthanded as "Red, Green, Refactor."

#BDD
BDD focuses on obtaining a clear understanding of desired software behavior through discussion with stakeholders. It extends TDD by writing test cases in a natural language that non-programmers can read. This allows the developers to focus on _why_ the code should be created, rather than the technical details, and minimizes translation between the technical language in which the code is written and the domain language spoken by the business, users, stakeholders, project management, etc.
