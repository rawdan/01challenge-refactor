module Interactors
  SetPriceAndBonusPoints = lambda { |rental, customer|
    result = "Rental record for #{customer.customer_name}\n"
    if rental.movie.price_code == Movie::NEW_RELEASE
      amount_owed = rental.days_rented * 3
      frequent_renter_points = 1
      frequent_renter_points = 2 if rental.days_rented > 1
    elsif rental.movie.price_code == Movie::REGULAR
      amount_owed = 2
      amount_owed = (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
      frequent_renter_points = 1
    else rental.movie.price_code == Movie::CHILDRENS_MOVIE
      amount_owed = 1.5
      amount_owed = (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
      frequent_renter_points = 1
    end
    result += "Amount owed is $#{amount_owed}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  }
end