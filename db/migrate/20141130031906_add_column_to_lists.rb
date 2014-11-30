class AddColumnToLists < ActiveRecord::Migration
  def change
  	add_column :todolists, :completed, :boolean
  end
end
