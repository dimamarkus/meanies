class TakeOffUniquenessOfNumberOnComics < ActiveRecord::Migration
  def change
  	remove_index :comics, :number
  end

end
