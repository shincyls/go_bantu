class ProjectsController < ApplicationController

  require 'will_paginate/array'

  def index
    respond_to :html, :js
    @projects = Project.where(status: 2).order("created_at desc")
    @projects = @projects.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, flash: { success: 'Project was successfully created.' }
    else
      redirect_to root_url, flash: { danger: @project.errors.full_messages[0] }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def card
    respond_to :html, :js
    @projects = Array.new
    if params[:query].empty? || params[:query] == "all"
      @projects = Project.all.order("created_at desc")
    else
      result = PgSearch.multisearch(params[:query])
      result.each do |r|
        @projects << Project.find(r.searchable_id)
      end
    end
    @projects = @projects.paginate(:page => params[:page], :per_page => 6)
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

end
