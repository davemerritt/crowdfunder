class Project < ActiveRecord::Base
	has_many :pledges
	has_many :users, :through => :pledges

	def total_pledged
		total = total + @pledge
	end

	def formatted_price
    	price_in_dollars = goal.to_f / 100
    	sprintf("%.2f", price_in_dollars)
	end
end
