class Admin::QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_survey, only: [:new, :index, :create]

  def new
    @question = @survey.questions.new
  end

  def create
    @question = @survey.questions.new(question_params)

    if @question.save
      flash[:notice] = "Question was created. Now add some options."
      redirect_to edit_admin_question_path(@question)
    else
      flash.now[:error] = "Something went wrong."
      render :new
    end
  end

  def edit
    @options = []
    @question.qty_options.times do
      @options << @question.options.new
    end
  end

  def update
    if @question.update_attributes(question_params)
      flash[:notice] = 'Nice job! The question has been updated.'
      # redirect_to edit_admin_question_path()
      redirect_to admin_survey_path(@question.survey)
    else
      flash.now[:error] = "There was a problem."
      render :edit
    end
  end

  def show
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:survey_id, :body, :required, :qty_options, :multiple_permitted, options_attributes: [:id, :body, :_destroy])
  end


end
