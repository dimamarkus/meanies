class AddTitleNumberPermalinkToComics < ActiveRecord::Migration
  def change
  	add_column :comics, :title,     :string
  	add_column :comics, :number,    :integer
  	add_column :comics, :permalink, :string
  end
end
