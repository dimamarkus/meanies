class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :image

      t.timestamps
    end
  end
end
