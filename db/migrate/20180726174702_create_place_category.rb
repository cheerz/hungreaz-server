class CreatePlaceCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :place_categories do |t|
      t.string :tag, index: true, unique: true
      t.string :name

      t.timestamps
    end

    add_reference :places, :place_category, index: true
  end
end
