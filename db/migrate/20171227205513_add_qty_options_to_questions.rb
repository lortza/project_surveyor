class AddQtyOptionsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :qty_options, :integer, default: 1
    add_column :questions, :multiple_permitted, :boolean, default: false
  end
end
