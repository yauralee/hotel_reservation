class RequirementCase
  attr_accessor :customer_type, :weekday_number, :weekend_number

  def initialize(customer_and_dates)
    @weekday_number = 0
    @weekend_number = 0
    weekend_day = ['sat','sun']
    @customer_type = customer_and_dates['customer']
    customer_and_dates['dates'].each_value do |day_of_week|
      weekend_day.include?(day_of_week) ? @weekend_number += 1 : @weekday_number += 1
    end
  end
end