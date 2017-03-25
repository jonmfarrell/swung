class CreateDatesTable < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.integer :date_number
      t.integer :history_id
      
    end
  end
end
