class HomeController < ApplicationController

  layout "home"
  
  def index
  	@members = Member.all
  end
end