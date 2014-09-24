class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #render 404 error
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to page_path('blank'), :alert => exception.message
  end

  ##Override the devise default redirect path
  def after_sign_in_path_for(resource)
    if resource.sites.any?
      sites_path
    else
      page_path('dashboard')
    end
  end

  #obj = site/site_page
  #call on controller: before_filter -> { authorize! @site }, only: [:edit, :update, :destroy]
  #call on action: authorize!(@site)
  def authorize!(obj)
    ids = [obj.try(:user_id), obj.try(:site).try(:user_id)]
    return if ids.compact.empty?
    if !ids.include?(current_user.id)
      raise CanCan::AccessDenied.new('没有权限！' )
    end
  end

  private
    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    helper_method :mobile_device?
    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
    end
end
