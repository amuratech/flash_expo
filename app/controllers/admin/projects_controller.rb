class Admin::ProjectsController < ApplicationController
  before_filter :load_developer_new, :only => [:new]
  before_filter :load_developer_create, :only => [:create]
  layout "admin"
  
  def index
    params[:page] ||= 1
    @projects = Project.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @project = Project.find(params[:id])
    @developer = @project.developer
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:success_message] = "Project updated successfully."
        format.html { redirect_to admin_projects_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def new    
    @project = @developer.projects.build
  end

  def create
    @project = @developer.projects.build(params[:project])
    respond_to do |format|
      if @project.save
        flash[:success_message] = "Project created successfully."
        format.html { redirect_to admin_projects_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.destroy
        flash[:success_message] = "Project destroyed successfully."
        format.html { redirect_to admin_projects_path }
      else
        
      end
    end
  end

  private
  def load_developer_new
    @developer = Developer.find(params[:developer])
  end
  def load_developer_create
    @developer = Developer.find(params[:project][:developer_id])
  end
end
