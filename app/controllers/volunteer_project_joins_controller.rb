class VolunteerProjectJoinsController < ApplicationController
	def new
        @project_volunteer = VolunteerProjectJoin.new
    end

    def create
        # respond_to :html, :js
        vp = params[:volunteer_project_join]
        @project_volunteer = VolunteerProjectJoin.new(volunteer_id: vp[:volunteer_id], project_id: vp[:project_id], status: vp[:status])
        if @project_volunteer.save
            redirect_to @project_volunteer.project, flash: { success: 'Request was successfully created.' }
        else
            redirect_to @project_volunteer.project, flash: { info: @project_volunteer.errors.full_messages[0] }
        end
    end

    def show
        @project_volunteer = VolunteerProjectJoin.find(params[:id])
    end

    def interested
        @project_volunteer = VolunteerProjectJoin.new(volunteer_id: params[:volunteer], project_id: params[:project], status: 0)
        if @project_volunteer.save
            respond_to do |format|
                format.html
                format.js { flash.now[:success] = "Thanks you for the volunteer request, kindly please be waited for your update." }
            end
        else
            respond_to do |format|
                format.html
                format.js { flash.now[:info] = @project_volunteer.errors.full_messages[0] }
            end
        end
    end

    private

    def organizer_params
        params.require(:volunter_project_join).permit(:volunteer_id, :status, :project_id)
    end
end
