class Hotel
  attr_accessor :rating, :regular_weekday_rates, :regular_weekend_rates, :rewards_weekday_rates, :rewards_weekend_rates
  # @rating
  # @regular_weekday_rates
  # @regular_weekend_rates
  # @rewards_weekday_rates
  # @rewards_weekend_rates

  def initialize(hotel_info)
    @rating = hotel_info['rating']
    @regular_weekday_rates = hotel_info['regularCustomer']['weekdayRates']
    @regular_weekend_rates = hotel_info['regularCustomer']['weekendRates']
    @rewards_weekday_rates = hotel_info['rewardsCustomer']['weekdayRates']
    @rewards_weekend_rates = hotel_info['rewardsCustomer']['weekendRates']
  end
end