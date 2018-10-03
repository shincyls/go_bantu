class OrganizersController < ApplicationController

    def new
        @organizer = Organizer.new
    end

    def create
        #respond_to :html, :js
        @organizer = Organizer.new(organizer_params)
        if @organizer.save
            redirect_to new_organizer_path, flash: { success: 'Organization was successfully created.' }
        else
            redirect_to new_organizer_path, flash: { danger: @organizer.errors.full_messages[0] }
        end
    end

    def show
        @organizer = Organizer.find(params[:id])
    end

    private

    def organizer_params
        params.require(:organizer).permit(:user_id, :company_name, :email, :description, :phone_number1, :phone_number2, 
            :website_link, :facebook_link, :instagram_link, :twitter_link, :linkedin_link, 
            :address_1, :address_2, :postcode, :city, :state, :country, :logo)
    end

end

