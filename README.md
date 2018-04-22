# FinFriend

This is a demo project where I practice fintech database modeling, following the MVC pattern with Rails, implementing data upkeep automation, unit testing, and using Ruby to perform financial calculations. 

FinFriend is a Rails app that allows users to create a credit card account and all the functionality associated with having a credit card.

This is a work in progress that I'm using to learn - any feedback is welcome!

The app is ([live on Heroku (click here)](https://finfriend.herokuapp.com/).

### How to install the code locally

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`

### Functionality:

This app uses a background process gem ([clockwork](https://github.com/Rykian/clockwork)) and a Procfile ([foreman](https://github.com/ddollar/foreman)) to update the interest accrued on a user's opening monthly balance at close of business, and to update the card's balance at the end of month. See Procfile, clock.rb, and related models and methods.

`$ gem install foreman`

`$ foreman start`

#### Finfriend cards function as follows:
- Each card has an APR and Credit Limit.
- Interest is calculated daily at the close of each day, but not applied.
- Interest is applied to the balance at the close of each month (opening day excluded). 
  
#### FinFriend is able to:
- Create an account (e.g. opening a new credit card)
- Keep track of charges 
- Keep track of payments
- Provide the outstanding balance for any given day (such as "10 days after account opening")
