# FinFriend

FinFriend is a rails app that allows users to create a credit card account and all the functionality associated with having a credit card.

### How to install the code locally

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`

### Functionality:

This app uses a background process gem ([clockwork](https://github.com/Rykian/clockwork)) and a PROCILE ([foreman](https://github.com/ddollar/foreman)) to update user credit card accrued interest and balances on a daily basis, and to update a user's credit card's balance at end of month. See PROCFILE, clock.rb, and related models and methods.

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
