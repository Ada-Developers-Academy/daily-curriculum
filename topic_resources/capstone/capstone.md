# Capstone Project

The Capstone Project is the largest undertaking you'll experience in the Ada classroom.

Not only is it a month long, but you will be your own product owner. It will be up to you to decide (with input from instructors, mentors, and TAs) what gets built when (and how).

Before building your applications, you will need to create a product plan:

  - identify your target audience and their unmet needs.
  - write a project specification to explain how you will meet those needs, including the features to implement.
  - create an incremental delivery plan.

## Delivery
The Capstone Project consists of the following components:

- Completed application, live on the web
- The source code of your project on Github, with:
  - Clear documentation on how to setup/install your project
  - Any third-party dependencies or configuration required
  - A link to your Trello board
  - A link to your Product Plan
- Product Plan: problem statement, user persona(s), market research
- Project presentation, a demo of the application and product plan

## Product Plan Components: Due October 9th.

1. __Problem Statement__: A clear, concise statement describing the problem your project will solve.
1. __Market Research__: Outline the key insights from your research, incuding:
  - your application’s competition - what alternatives are already out there (competing apps and/or non-app solutions)
  - research from users on why these alternatives do not effectively address the problem.
  - differentiation: what makes your idea/product different
1. __User Personas__: A summary of your main target user group(s). What are their key characteristics? How do those characteristics factor into project/app/idea?

## Application: Due October 30th.

The capstone is an individual project, but I encourage you to work together to solve specific problems. You will need to meet all of the goals and guidelines listed below, including at least two _advanced features_ and at least two _integrations_ from (or similar to) the lists below.

### Goals & Guidelines
- Use your product plan to lead the functionality development of their application
- Create and maintain a [Trello board](https://trello.com/) to document progress on your project.
- Host the application using a VPS such as Amazon EC2
- Configure DNS with custom domain
- Create a stylized, responsive design for all devices (phone, tablet, display)
- At least 10 items of seed data for each concept/model
- Use background jobs for any long running tasks (email, image processing, 3rd party data manipulation)
- Use caching for slow or bulky database interactions
- Use performance analytics to asses and optimize site performance (average server response time < 300ms)
- Practice TDD to lead the development process
- Integrate email (At least user signup)
- Expectations for code quality:
    - 90% or greater test coverage (models and controllers)
    - Javascript tests (client and server side) w/ Mocha
    - B- or greater score on Code Climate
    - No security issues (Brakeman)

### Integration Choices
- Choose at least two complex integrations, examples:
  - Background/Async Jobs (sending emails, confirming registrations)
  - NoSql (MongoDB)
  - Content Delivery Network (CDN)
  - Payment Processing (Stripe)
  - Front-end Framework (Ember, Angular, Backbone, etc.)
  - Third-party OAuth (logging in w/ Twitter, Github, etc.)

### Advanced Feature Choices
- Choose at least two advanced features, examples:
  - Secure Socket Layer (SSL)
  - Content Management System (CMS)
  - Internationalization (i18n)
  - Live Events (notifications, live updates, think back to Philip's AWS presentation)
  - Service Oriented Architecture (SOA)
  - S3 storage/delivery
  - Secure Public API (documented)

__Instructors will verify that your choices for integrations and advanced features are appropriate__
