class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :gender_id, null: false
      t.integer :gender_preference_id
      t.integer :favorite_team_id
      t.integer :least_favorite_team_id

      t.timestamps
    end
  end
end
