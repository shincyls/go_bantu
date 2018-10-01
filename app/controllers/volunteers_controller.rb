class VolunteersController < ApplicationController

    def index
    end

    def new
        @volunteer = Volunteer.new
    end

    def create
        #respond_to :html, :js
        @volunteer = Volunteer.new(volunteer_params)
        if @volunteer.save
            redirect_to new_volunteer_path, flash: { success: 'Volunteer was successfully created.' }
        else
            redirect_to new_volunteer_path, flash: { danger: @volunteer.errors.full_messages[0] }
        end
    end


    private

    def volunteer_params
        params.require(:volunteer).permit(:user_id, :cv_file, :linked_in_url, 
            volunteer_skill_joins_attributes: [:volunteer_id, :skill_id],
            volunteer_profession_joins_attributes: [:volunteer_id, :profession_id]
        )
    end

end
