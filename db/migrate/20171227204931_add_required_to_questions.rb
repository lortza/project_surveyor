class AddRequiredToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :required, :boolean, default: false
  end
end
