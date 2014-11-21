class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :label
      t.integer :question_group_id
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
