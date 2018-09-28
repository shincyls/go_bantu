class ProjectsController < ApplicationController

  require 'will_paginate/array'

  def index
    respond_to :html, :js
    @projects = Project.where(status: 2).order("created_at desc")
    @projects = @projects.paginate(:page => params[:page], :per_page => 6)
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

end
