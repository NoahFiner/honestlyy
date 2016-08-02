class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d
      t.integer :count_a
      t.integer :count_b
      t.integer :count_c
      t.integer :count_d

      t.timestamps
    end
  end
end
