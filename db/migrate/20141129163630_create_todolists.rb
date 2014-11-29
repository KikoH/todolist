class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
    	t.string :title
    	t.text :description
    	t.datetime :due
      t.timestamps
    end
  end
end
