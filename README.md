# Work and Play App

## User Stories

#### Accounts
  * As a user, I want to be able to easily create a new account.
  * As a user, I want to be able to easily login and out of my account.

#### Personal User Functionality
  * As a user, I want to create new tasks in seconds.
  * As a user, I want to be able to mark off my tasks as complete with the click of a button.
  * As a user, I want to be able to edit my task, and change them from "Work" to "Play" and vice-versa.
  * As a user, I want to be able to delete my tasks without hassles. I don't want to encounter multiple prompts that ask me, "Are you sure?"
  * As a user, I want to have an overview of my work-play balance that I can understand and analyze.
  * As a user, I want to use tags for my tasks so that I can easily search for them.
  * As a user, I want to be able to view all my tags.
  * As a user, I want to be able to view all my tasks that belong to a particular tag.

#### User to User Functionality
  * As a user, I want to be able to view all user's tags, as well as seeing all tasks that belong to that tag.
  * As a user, I want to be able to view other user's tasks list and feel connected to them.
  * As a user, I want to be able to "Like" other people's tasks, and motivate them.
  * As a user, I want to have an overview of everyone's work-play balance.  

## Models
A user can have many tasks (one-to-many relationship). A task can have many tags, and a tag can belong to many tasks (many-to-many relationship). A task can have many likes (one-to-many relationship).

#### Users
  * first name
  * last name
  * email address
  * password
  * work-play score

#### Tasks
  * description
  * type of tasks (work or fun)
  * points (how many positive or negative points does this task give)

#### Tags
  * Content

#### Likes

## Technologies Used
Ruby on Rails
