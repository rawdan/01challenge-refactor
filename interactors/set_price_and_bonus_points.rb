module Interactors
  SetPriceAndBonusPoints = lambda { |rentals, customer|
    amount_owed = 0
    frequent_renter_points = 0
    result = "Rental record for #{customer.customer_name}\n"
    rentals.each do |rental|
      individual_film_amount = 0
      if rental.movie.price_code == Movie::NEW_RELEASE
        individual_film_amount += rental.days_rented * 3
        (Movie::NEW_RELEASE && rental.days_rented > 1) ? frequent_renter_points += 2 : frequent_renter_points += 1
      elsif rental.movie.price_code == Movie::REGULAR
        rental.days_rented > 2 ? individual_film_amount += (rental.days_rented - 2) * 1.5 : individual_film_amount += 2
        frequent_renter_points += 1
      else rental.movie.price_code == Movie::CHILDRENS_MOVIE
      # I have no idea why a customer should receive a discount for renting (and thus withholding an asset) for a longer period of time
      # for example from 1 day up to 4 days, the price is the same: '1.5'
      rental.days_rented > 3 ? individual_film_amount += (rental.days_rented - 3) * 1.5 : individual_film_amount += 1.5
      frequent_renter_points += 1
      end
      result += "\t" + rental.movie.title_for_movie + "\t" + "$" + individual_film_amount.to_s + "\n"
      amount_owed += individual_film_amount
    end
    result += "Amount owed is $#{amount_owed}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  }
end