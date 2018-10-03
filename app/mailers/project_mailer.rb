class ProjectMailer < ApplicationMailer
	def status_email(organizer,project) # arguments passed from braintree controller
      @project = project
      @user = organizer
      mail(to: @user.email, subject: "GoBantu Project Request Status")
	end
end
