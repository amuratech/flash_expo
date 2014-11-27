class Admin::ProjectsController < ApplicationController
  
  layout "admin"
  
  def index
    params[:page] ||= 1
    @projects = Project.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end
end
