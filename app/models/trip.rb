class Trip < ActiveRecord::Base

validates :commute, presence: true

	# move to separate module
	# def sec_to_min(seconds) 
	# 	mm, ss = seconds.divmod(60)
	# 	"%d:%d" %[mm, ss]
	# end

	def completed?
		true if start_time && end_time
	end

	def duration
		end_time - start_time if completed?
	end

	def clock_time(input)
		if input == "start" && start_time
			start_time.strftime("%H:%M:%S")
		elsif input == "end" && end_time
			end_time.strftime("%H:%M:%S")
		end
	end

	def self.average_time(commute_type)
		if commute_type == "To Work"
			@trips = Trip.where("commute = ?", "To Work")
		elsif commute_type == "To Home"
			@trips = Trip.where("commute = ?", "To Home")
		else
			@trips = Trip.all
		end

		if @trips.present?
			@averages = 0
			@trip_count = 0

			@trips.each do |trip|
				if trip.completed?
					@averages += trip.duration
					@trip_count += 1
				end
			end

			@trip_average = @averages / @trip_count
		end
	end


end
