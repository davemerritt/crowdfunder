class Project < ActiveRecord::Base
	def formatted_price
    	price_in_dollars = goal.to_f / 100
    	sprintf("%.2f", price_in_dollars)
	end
end
