class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :image
      t.string :name
      t.string :team
      t.string :title
      t.string :office

      t.timestamps
    end
  end
end
