class BraintreeController < ApplicationController
 
  def new
  @project = Project.find(params[:id])
  @client_token = Braintree::ClientToken.generate
  end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  donation_amount = params["checkout_form"]["amount"].to_f
	  project_id = params["checkout_form"]["project"] #params passed from checkout form 

	  
	  result = Braintree::Transaction.sale(
	   :amount => params["checkout_form"]["amount"].to_s, #params passed from checkout form 
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	if current_user.donor.nil?
	  		@donor = Donor.new(user_id: current_user.id)
	  		@donor.save
	  	else
	  		@donor = Donor.find_by(user_id: current_user.id)
	  	end
	  	donation = Donation.new(donor_id: @donor.id, project_id: project_id, amount: donation_amount)
	  	donation.save

	    redirect_to project_url(project_id), :flash => { :notice => "Transaction successful!" }
	  else
	    redirect_to 'projects/#{project_id}/donation/transaction', :flash => { :notice => "Transaction failed. Please try again." }
	  end

	end

end
