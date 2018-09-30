class BraintreeController < ApplicationController
 
  def new
  # @project = Project.find(params[:id])
  @project = Project.find(1)
  # @client_token = Braintree::ClientToken.generate
  end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => params["checkout_form"]["amount"].to_s, #params passed from checkout form 
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	project_id = params["checkout_form"]["project"] #params passed from checkout form 
	  	project = Project.find(project_id)
	  	project.status = 1 #change status to booked after payment
	  	project.save
	  	host = project.listing.user.id
	  	# ReservationMailer.booking_email(current_user,booking, host).deliver
		# ReservationJob.perform_later(current_user,booking, host) # Job to multithread system
	    redirect_to project_url(project_id), :flash => { :notice => "Transaction successful!" }# back to reservation page
	  else
	    redirect_to :root, :flash => { :notice => "Transaction failed. Please try again." }
	  end
	end

end
