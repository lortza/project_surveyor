class SurveysController < ApplicationController

  def index
    @surveys = Survey.all.order(:name)
  end

end
