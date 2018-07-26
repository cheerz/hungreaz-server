class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float  :lng
      t.float  :lat
      t.string :first_image_url
      t.string :second_image_url
      t.string :third_image_url
      t.string :fourth_image_url
      t.string :fifth_image_url
      t.timestamps
    end
  end
end
