class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end


  def after_sign_in_path_for(resource)
    hq_index_path 
  end
  
  # def current_order
  #   if !params[:id].nil?
  #     Order.find(params[:id])
  #   else
  #     Order.new
  #   end
  # end
  
  
end
