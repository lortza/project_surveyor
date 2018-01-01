class SurveysController < ApplicationController

  def index
    @surveys = Survey.all.order(:id)
  end

  def take
    @survey = Survey.find(params[:id])
    @users = User.all.order(:name)
  end

  def create
    @survey = Survey.find(params[:id])
    @user = User.find(params[:user_id])
    answer_ids = checkbox_ids + radio_ids

    answer_ids.each do |answer_id|
      UserAnswer.create!({
        user_id: @user.id,
        question_option_id: answer_id
        })
    end

    flash[:notice] = "Thanks for filling out #{@survey.title}!"
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :user_id, {checkbox_ids: [], radio_ids: []})
  end

  def checkbox_ids
    params[:checkbox_ids] ? params[:checkbox_ids] : []
  end

  def radio_ids
    params[:radio_ids] ? params[:radio_ids].values : []
  end



end
