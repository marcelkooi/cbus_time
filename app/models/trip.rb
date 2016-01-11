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
		@trip_count = 0

		@trips.each do |trip|
			if trip.end_time.present?
				@averages += trip.end_time - trip.start_time
				@trip_count += 1
			end
		end

		@trip_average = @averages / @trip_count if @trips.present?

	end


end
