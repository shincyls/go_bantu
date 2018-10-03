class DonationMailer < ApplicationMailer
	def donor_email(donor,amount,project) # arguments passed from braintree controller
      @project = project
      @user = donor
      @amount = amount
      mail(to: @user.email, subject: "GoBantu Donation")
	end

	def organization_email(organizer,amount,project)
	  @project = project
      @user = organizer
      @amount = amount
      mail(to: @user.email, subject: "GoBantu Donation")
	end

end
