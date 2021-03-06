class ProjectsController < ApplicationController
  # only organizer can create new project
  before_action :is_organizer!, only: [:new, :create]
  
  include ProjectsHelper
  require 'will_paginate/array'

  def index
    respond_to :html, :js
    @projects = Project.where(status: 2).order("created_at desc")
    @projects = @projects.paginate(:page => params[:page], :per_page => 6)
    @project_volunteer = VolunteerProjectJoin.new
  end

  def new
    if current_user && current_user.organizer.present?
      @project = Project.new
    else
        redirect_to new_user_session_path, flash: { warning: "Login to host a project after become a organizer!" }
    end
  end



  def create
    @project = Project.new(project_params)
    if @project.save
      OrganizerProjectJoin.new(organizer_id: current_user.organizer.id, project_id: project.id, status: 0).save
      redirect_to @project, flash: { success: 'Project was successfully created, please wait for review and approval within 5 working days.' }
    else
      redirect_to new_project_path, flash: { danger: @project.errors.full_messages[0] }
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_volunteer = VolunteerProjectJoin.new
    #verify project is approved
    check_status

    #automatch feature
    matched_volunteers(@project.id)
    # set percent match for user
    if @hundred
      @matched_volunteers
      @match_percent = "100%"
    elsif @seventy_five
      @match_percent = "75%"
    elsif @fifty
      @match_percent = "50%"
    elsif @twenty_five
      @match_percent = "25%"
    else 
      # for empty array to pass message on user show
      @matched_volunteers
    end
    if signed_in?
    @verify_organizers = @project.organizers.where(user_id: current_user.id).exists?
    end

  end

  def card
    respond_to :html, :js
    @projects = Array.new
    if params[:query].empty? || params[:query] == "all"
      @projects = Project.all.where(status: 2).order("created_at desc")
    else
      @projects = Project.search_projects(params[:query])
    end
    # Checkbox to filter volunteer and donation
    @projects = @projects.where(volunteer_number: 0) if !params[:volunteer] # if empty, don't want show volunteer > 0 or select only volunteer = 0
    @projects = @projects.where(fund_amount: 0) if !params[:donate] # if empty, don't want show fund > 0 or select only fund = 0

    # Final Result
    @projects = @projects.paginate(:page => params[:page], :per_page => 6)
  end

  def confirmations
    if signed_in? 
      unless current_user.admin?
        redirect_to root_path
      end
    end
    @projects = Project.where(status: 'pending')
  end

  def status_change
    @project = Project.find(params[:id])
    organizer = @project.organizers.first.user
    if @project.pending?
      @project.status = 'approved'
      @project.save
      ProjectMailer.status_email(organizer,@project).deliver
      redirect_to confirmations_projects_path, notice: 'Project was approved.'
    else
      @project.status = 'pending'
      @project.save
      redirect_to confirmations_projects_path, notice: 'Status changed to pending.'
    end

  end

  def status_deny
    @project = Project.find(params[:id])
    organizer = @project.organizers.first.user
    if @project.pending?
      @project.status = 'rejected'
      @project.save
      ProjectMailer.status_email(organizer,@project).deliver
      redirect_to confirmations_projects_path, notice: 'Project was denied.'
    else
      @project.status = 'pending'
      @project.save
      redirect_to confirmations_projects_path, notice: 'Status changed to pending.'
    end

  end

  def check_status
    unless @project.approved? || signed_in? && (current_user.admin? || current_user == @project.organizers.first.user)
        redirect_to root_path
    end
  end


  private

  def project_params
    params.require(:project).permit(:organizer_id, :title, :project_desc, 
      :requirement_desc, :contact_person1, :contact_number1, :contact_person2, :contact_number2,
      :address_1, :address_2, :postcode, :city, :state, :country,
      :latitude, :longitude, :start_date, :end_date, :volunteer_number, :fund_amount,
      :volunteer, :finance_donate,
      project_skill_joins_attributes: [:project_id, :skill_id],
      project_profession_joins_attributes: [:project_id, :profession_id],
      project_cause_joins_attributes: [:project_id, :cause_id],
      project_category_joins_attributes: [:project_id, :category_id]
    )
  end

  def authenticate_user!
    if current_user.id != @user.id
      redirect_back(fallback_location: root_path)
    end
  end

  def not_organizer!
    if !current_user.organizer
      redirect_back(fallback_location: root_path)
    end
  end

  def is_organizer!
    if !current_user
           redirect_to new_user_session_path, flash: { warning: "Login to host a project after become a organizer!" }
    elsif  unless current_user.organizer
          redirect_back(fallback_location: root_path, flash: { warning: "Become a organizer to host a project!" })
          end
    end
  end
   

end
