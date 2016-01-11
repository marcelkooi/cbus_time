class Trip < ActiveRecord::Base

validates :commute, presence: true



	def self.average_time(commute_type)
		if commute_type == "To Work"
			@trips = Trip.where("commute = ?", "To Work")
		elsif commute_type == "To Home"
			@trips = Trip.where("commute = ?", "To Home")
		else
			@trips = Trip.all
		end

		@averages = 0

		@trips.each do |trip|
			@averages += trip.end_time - trip.start_time
		end

		@trip_average = @averages / @trips.count

	end


end
