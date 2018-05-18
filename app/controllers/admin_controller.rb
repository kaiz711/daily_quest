class AdminController < ApplicationController
  def index
    @userquest = Userquest.all.order("created_at DESC")
  end
  
  def admin
    if current_user.has_role? :admin
      redirect_to '/admin/index'
    else
      not_found
    end
  end
end
