class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: '您无权访问此页面。'.freeze)
  end
end
