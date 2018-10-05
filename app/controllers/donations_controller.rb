class DonationsController < ApplicationController
	def project
		@project = Project.find(params[:id])
		if user_signed_in?
			if !@project.organizers.where(user_id: current_user.id).exists?
				redirect_to root_path
			end	
		else
			redirect_to root_path
		end
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
