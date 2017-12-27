class AdminController < ApplicationController

  layout "admin"


  def home
    @surveys = Survey.all.order('title')
  end

end
