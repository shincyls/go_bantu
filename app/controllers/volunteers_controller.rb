class VolunteersController < ApplicationController

    def index
        respond_to :html, :js
        @volunteers = Volunteer.all.order("created_at desc")
        @volunteers = @volunteers.paginate(:page => params[:page], :per_page => 8)
    end

    def new
         # add validation
        if current_user
            @volunteer = Volunteer.new
        else
            redirect_to new_user_session_path, flash: { warning: "Login to become a volunteer!" }
        end
    end


    def create
        #respond_to :html, :js
        @volunteer = Volunteer.new(volunteer_params).url_protocol
        
        if @volunteer.save
            redirect_to edit_user_registration_path(@volunteer.user.id), flash: { success: 'Thank You! Volunteer have been successfully registered, kindly updated profile photo and location' }
        else
            redirect_to new_volunteer_path, flash: { danger: @volunteer.errors.full_messages[0] }
        end
    end

    def card
        respond_to :html, :js
        @volunteers = Array.new
        if params[:query].empty? || params[:query] == "all"
          @volunteers = Volunteer.all.order("created_at desc")
        else
          @volunteers = Volunteer.search_volunteers(params[:query])
        end
        @volunteers = @volunteers.paginate(:page => params[:page], :per_page => 6)
    end

    private

    def volunteer_params
        params.require(:volunteer).permit(:user_id, :description, :cv_file, :linked_in_url, 
            volunteer_cause_joins_attributes: [:volunteer_id, :cause_id],
            volunteer_skill_joins_attributes: [:volunteer_id, :skill_id],
            volunteer_profession_joins_attributes: [:volunteer_id, :profession_id]
        )
    end

end
