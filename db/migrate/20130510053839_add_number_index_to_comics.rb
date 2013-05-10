class AddNumberIndexToComics < ActiveRecord::Migration
  def change
  	add_index :comics, :number, unique: true
  end
end
