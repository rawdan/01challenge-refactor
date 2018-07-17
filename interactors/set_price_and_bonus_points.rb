module Interactors
  SetPriceAndBonusPoints = lambda { |rentals, customer|
    amount_owed = 0
    frequent_renter_points = 0
    result = "Rental record for #{customer.customer_name}\n"
    rentals.each do |rental|
      if rental.movie.price_code == Movie::NEW_RELEASE
        amount_owed += rental.days_rented * 3
        (Movie::NEW_RELEASE && rental.days_rented > 1) ? frequent_renter_points += 2 : frequent_renter_points += 1
      elsif rental.movie.price_code == Movie::REGULAR
        rental.days_rented > 2 ? amount_owed += (rental.days_rented - 2) * 1.5 : amount_owed += 2
        frequent_renter_points += 1
      else rental.movie.price_code == Movie::CHILDRENS_MOVIE
      amount_owed += 1.5
      amount_owed += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
      frequent_renter_points += 1
      end
    end
    result += "Amount owed is $#{amount_owed}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  }
end