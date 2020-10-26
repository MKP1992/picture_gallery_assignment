class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_category
  private
  def find_category
  	@root_category = Category.all
  end
end
