class AddDefaultsToQuestions < ActiveRecord::Migration[5.0]
  def change
    change_column_default :questions, :count_a, 0
    change_column_default :questions, :count_b, 0
    change_column_default :questions, :count_c, 0
    change_column_default :questions, :count_d, 0
  end
end
