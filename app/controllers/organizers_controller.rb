class OrganizersController < ApplicationController
    # Not organizer only can create new organization
    before_action :not_organizer!, only: [:new, :create]

    def new
        @organizer = Organizer.new
    end

    def create
        # respond_to :html, :js
        @organizer = Organizer.new(organizer_params).url_protocol

        if @organizer.save
            redirect_to @organizer, flash: { success: 'Organization was successfully created.' }
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
            :website_url, :facebook_url, :instagram_url, :twitter_url, :linkedin_url, 
            :address_1, :address_2, :postcode, :city, :state, :country, :logo)
    end

    def not_organizer!
        if current_user.organizer
          redirect_back(fallback_location: root_path)
        end
    end

end

