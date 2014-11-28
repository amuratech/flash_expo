class Admin::DevelopersController < ApplicationController
  
  layout "admin"
  
  def index
    params[:page] ||= 1
    @developers = Developer.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    respond_to do |format|
      if @developer.update_attributes(params[:developer])
        flash[:success_message] = "Developer updated successfully."
        format.html { redirect_to admin_developers_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(params[:developer])
    respond_to do |format|
      if @developer.save
        flash[:success_message] = "Developer created successfully."
        format.html { redirect_to admin_developers_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def destroy
    @developer = Developer.find(params[:id])
    respond_to do |format|
      if @developer.destroy
        flash[:success_message] = "Developer destroyed successfully."
        format.html { redirect_to admin_developers_path }
      else

      end
    end
  end
end
