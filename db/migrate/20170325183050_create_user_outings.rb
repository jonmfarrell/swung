class CreateUserOutings < ActiveRecord::Migration
  def change
    create_table :user_outings do |t|
      t.integer :user_id
      t.integer :outing_id
    end
  end
end
