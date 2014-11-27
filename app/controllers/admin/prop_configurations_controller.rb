class Admin::PropConfigurationsController < ApplicationController
  before_filter :load_project_new, :only => [:new]
  before_filter :load_project_create, :only => [:create]
  layout "admin"
  
  def index
    params[:page] ||= 1
    @prop_configurations = PropConfiguration.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @prop_configuration = PropConfiguration.find(params[:id])
    @project = @prop_configuration.project
  end

  def update
    @prop_configuration = PropConfiguration.find(params[:id])
    respond_to do |format|
      if @prop_configuration.update_attributes(params[:prop_configuration])
        flash[:success_message] = "Configuration updated successfully."
        format.html { redirect_to admin_prop_configurations_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def new
    @prop_configuration = PropConfiguration.new
  end

  def create
    @prop_configuration = PropConfiguration.new(params[:prop_configuration])

    respond_to do |format|
      if @prop_configuration.save
        flash[:success_message] = "Configuration created successfully."
        format.html { redirect_to admin_prop_configurations_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @prop_configuration = PropConfiguration.find(params[:id])
  end

  # def destroy
  #   @prop_configuration = PropConfiguration.find(params[:id])
  #   respond_to do |format|
  #     if @prop_configuration.destroy
  #       flash[:success_message] = "Configuration destroyed successfully."
  #       format.html { redirect_to admin_prop_configurations_path }
  #     else

  #     end
  #   end
  # end

  private
  def load_project_new
    @project = Project.find(params[:project])
  end
  def load_project_create
    @project = Project.find(params[:prop_configuration][:project_id])
  end
end
