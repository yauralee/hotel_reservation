class Calculator

  def reservation(requirement_case, hotels)
    customer_type = requirement_case.customer_type
    weekday_number = requirement_case.weekday_number
    weekend_number = requirement_case.weekend_number
    hotels_and_prices = {}
    hotels.map do |hotel|
      hotels_and_prices[hotel] = hotel.send(customer_type + '_weekday_rates') * weekday_number + hotel.send(customer_type + '_weekend_rates') * weekend_number
    end
    cheapest_hotels = cheapest_hotels(hotels_and_prices)
    optimal_choice = cheapest_hotel_with_highest_rating(cheapest_hotels)[0]
    optimal_choice.name
  end

  private
  def cheapest_hotels(hotels_and_prices)
    min_price = hotels_and_prices.values.min
    hotels_and_prices.reject{|hotel, price| price != min_price}.keys
  end

  def cheapest_hotel_with_highest_rating(cheapest_hotels)
    ratings = []
    cheapest_hotels.each do |hotel|
      ratings << hotel.rating
    end
    cheapest_hotels.select do |hotel|
      hotel.rating == ratings.max
    end
  end
end