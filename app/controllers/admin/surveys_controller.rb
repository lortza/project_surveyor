class Admin::SurveysController < AdminController

  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:notice] = 'Survey was successfully created.'
      redirect_to admin_survy_path(@survey)
    else
      flash.now[:error] = 'Something went wrong.'
      render :new
    end

  end

  def update
    if @survey.update(survey_params)
      flash[:notice] = 'Survey was successfully updated.'
      redirect_to admin_survy_path(@survey)
    else
      flash.now[:error] = 'Something went wrong.'
      render :edit
    end

  end

  def destroy
    @survey.destroy
    flash[:notice] = 'Survey was successfully deleted.'
    redirect_to admin_surveys_url
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
