class DonationsController < ApplicationController
	def project
		@project = Project.find(params[:id])
	end

	def donor
		if current_user != User.find(params[:id])
			redirect_to root_path
		end
		donor = Donor.find_by(user_id: params[:id])
		if !donor.nil?
			@donor = donor
		end 

	end
end
