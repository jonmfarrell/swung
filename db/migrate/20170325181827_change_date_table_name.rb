class ChangeDateTableName < ActiveRecord::Migration
  def change
    rename_table :dates, :outings
  end
end
