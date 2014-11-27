class Admin::DevelopersController < ApplicationController
  
  layout "admin"
  
  def index
    params[:page] ||= 1
    @developers = Developer.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def new
    @developer = Developer.new
  end
end
