class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :image
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end