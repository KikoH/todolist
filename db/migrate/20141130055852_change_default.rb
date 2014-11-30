class ChangeDefault < ActiveRecord::Migration
  def change
  	change_column :todolists, :completed, :boolean, :default => false
  end
end
