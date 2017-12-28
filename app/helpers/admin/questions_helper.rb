module Admin::QuestionsHelper

  def display_question(question)
    base = "#{question.body}"
    multi = "<span class='multi'>(Select Multiple)</span>"
    required = "<span class='required'>*</span>"

    if question.required? && question.multiple?
      raw(base + required + multi)
    elsif question.required?
      raw(base + required)
    elsif question.multiple?
      raw(base + multi)
    else
      base
    end
  end

end
