class HomeController < ApplicationController
	before_action :authenticate_user!, expect: [:index]

  def index
  end

  def about
  end
end
