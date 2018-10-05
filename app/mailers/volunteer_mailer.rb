class VolunteerMailer < ApplicationMailer
	def volunteer_email(interest) # arguments passed from braintree controller
      @project = interest.project
      @user = interest.volunteer.user
      @interest = interest
      mail(to: @user.email, subject: "GoBantu Donation")
	end
end
