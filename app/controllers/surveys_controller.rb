class SurveysController < ApplicationController

  def index
    @surveys = Survey.all.order(:id)
  end

  def take
    @survey = Survey.find(params[:id])
    @users = User.all.order(:name)
  end

  def results
    @survey = Survey.find(params[:id])
  end

  def create
    # TO DO: show form errors to user

    @survey = Survey.find(params[:id])
    @user = User.find(params[:user_id])
    answer_ids = checkbox_ids + radio_ids
    submission_id = @survey.generate_token(@user)

    answer_ids.each do |answer_id|
      UserAnswer.create!({
        user_id: @user.id,
        question_option_id: answer_id,
        submission_id: submission_id
        })
    end

    flash[:notice] = "Thanks for filling out #{@survey.title}!"
    redirect_to survey_results_path(@survey)
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
