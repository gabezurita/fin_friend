require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'active_support/time' # Allow numeric durations (eg: 1.minutes)

include Clockwork

module Clockwork
  handler do |job|
    case job
    when 'credit_card.update'
      CreditCard.all.each do |card|
        puts "Updating Credit Card ID: #{card.id}"
        card.accumulate_daily_accrued_interest
        card.monthly_balance_update!
      end
    else
      puts "Couldn't find your job!"
    end
  end
  every(1.day, 'credit_card.update') # the string indicates an arbitrary job name
end
