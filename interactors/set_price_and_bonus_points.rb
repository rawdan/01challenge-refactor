module Interactors
  SetPriceAndBonusPoints = lambda { |rental, customer|
    if rental.movie.price_code == 1
      amount_owed = rental.days_rented * 3
      frequent_renter_points = 1
      frequent_renter_points = 2 if rental.days_rented > 1
      puts "The customer #{customer.customer_name} rented #{rental.movie.title_for_movie}"
      puts "He was awarded #{frequent_renter_points} frequent renter points and owes a total ammount of #{amount_owed}"
    elsif rental.movie.price_code == 0
      amount_owed = 2
      amount_owed = (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
      frequent_renter_points = 1
      puts "The customer #{customer.customer_name} rented #{rental.movie.title_for_movie}"
      puts "He was awarded #{frequent_renter_points} frequent renter points and owes a total ammount of #{amount_owed}"
    else rental.movie.price_code == 2
      amount_owed = 1.5
      amount_owed = (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
      frequent_renter_points = 1
      puts "The customer #{customer.customer_name} rented #{rental.movie.title_for_movie}"
      puts "He was awarded #{frequent_renter_points} frequent renter points and owes a total ammount of #{amount_owed}"
    end
  }
end