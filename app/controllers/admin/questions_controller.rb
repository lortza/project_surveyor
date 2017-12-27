class Admin::QuestionsController < ApplicationController

  before_action :set_survey, only: [:new, :index, :create]

  def new
    @question = Question.new
  end

  def create
    redirect_to :edit
  end

  def edit
  end

  def show
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def questions_params
  end


end
