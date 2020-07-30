# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    User and BoardGame
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has_many BoardGames
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    BoardGame belongs_to User
- [x] Include user accounts with unique login attribute (username or email)
    email must be unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users
    user must be logged in, and current user must match user associated with the game being modified
- [x] Include user input validations
    BoardGame model implements ActiveRecord validation of presence: true
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message