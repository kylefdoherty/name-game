class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :office
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
