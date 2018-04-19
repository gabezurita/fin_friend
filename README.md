# FinFriend

FinFriend is a rails app that allows users to create a credit card account and all the functionality associated with having a credit card.

### How to install the code locally

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`

### Functionality:

#### Given a credit card that functions as follows:
*Each card has an APR and Credit Limit.
*Interest is calculated daily at the close of each day, but not applied.
*Interest is applied to the balance at the close of each 30-day period (opening day excluded).
  e.g., asking for the balance on days 28 and 29 will give the same results, but asking for balance on day 30 will give the balance + all interest accrued.
#### FinFriend is able to:
*Create an account (e.g. opening a new credit card)
*Keep track of charges (e.g. card swipes)
*Keep track of payments
*Provide the outstanding balance for any given day (such as "10 days after account opening")

#### Test Scenario 1
*A customer opens a credit card with a $1,000.00 limit at a 35% APR.
T*he customer charges $500 on opening day (outstanding balance becomes $500).
*The customer does not make any more charges or any payments for 30 days.
*The total outstanding balance owed 30 days after opening should be $514.38.
500 * (0.35 / 365) * 30 = 14.38
#### Test Scenario 2
*A customer opens a credit card with a $1,000.00 limit at a 35% APR.
*The customer charges $500 on opening day (outstanding balance becomes $500).
*15 days after opening, the customer pays $200 (outstanding balance becomes $300).
*25 days after opening, the customer charges another $100 (outstanding balance becomes $400).
*The total outstanding balance owed on day 30 should be $411.99.
(500 * 0.35 / 365 * 15) + (300 * 0.35 / 365 * 10) + (400 * 0.35 / 365 * 5) = 11.99
