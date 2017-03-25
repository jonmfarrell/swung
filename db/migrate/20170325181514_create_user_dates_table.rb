class CreateUserDatesTable < ActiveRecord::Migration
  def change
    create_table :user_dates do |t|
      t.integer :user_id
      t.integer :date_id

      t.timestamps
    end
  end
end
