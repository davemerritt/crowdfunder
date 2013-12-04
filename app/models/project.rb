class Project < ActiveRecord::Base
	has_many :pledges
	has_many :users, :through => :pledges

	def current_project
		project = Project.id
		Pledge.where( :project_id => project.id ).where( :user_id => user.id )
	end

	def formatted_price
    	price_in_dollars = goal.to_f / 100
    	sprintf("%.2f", price_in_dollars)
	end
end
