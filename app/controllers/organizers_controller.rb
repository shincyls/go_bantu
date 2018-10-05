class OrganizersController < ApplicationController
    # Not organizer only can create new organization
    before_action :not_organizer!, only: [:new, :create]
    include OrganizersHelper
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

    def pending_volunteers
  
      project_volunteers
      approved_volunteers
      unless current_user.id = params[:id]
        redirect_to root_path
      end
    end


    def volunteer_change
        @interest = VolunteerProjectJoin.find(params[:id])
        organizer = @interest.project.organizers.first.user
        if @interest.interested?
          @interest.status = 'approved'
          @interest.save
          VolunteerMailer.volunteer_email(@interest).deliver
          redirect_to volunteer_approvals_path(organizer.id), notice: 'Volunteer was approved.'
        else
          @interest.status = 'interested'
          @interest.save
          redirect_to volunteer_approvals_path(organizer.id), notice: 'Status changed to interested.'
        end

    end

    def volunteer_deny
        @interest = VolunteerProjectJoin.find(params[:id])
        organizer = @interest.project.organizers.first.user
        if @interest.interested? || @interest.approved?
          @interest.status = 'rejected'
          @interest.save

          VolunteerMailer.volunteer_email(@interest).deliver
          byebug
          redirect_to volunteer_approvals_path(organizer.id), notice: 'Volunteer was denied.'
        else
          @interest.status = 'interested'
          @interest.save
          redirect_to volunteer_approvals_path(organizer.id), notice: 'Status changed to interested.'
        end

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

