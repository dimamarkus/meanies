class AddVisibleColumnToComics < ActiveRecord::Migration
	def up
	  add_column :comics, :visible, :boolean, :default => false
	end

	def down
	  remove_column :comics, :visible
	end
end
