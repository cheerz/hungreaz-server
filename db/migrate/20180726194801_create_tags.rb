class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :tag, index: true, unique: true
      t.string :name

      t.timestamps
    end

    create_table :place_tags do |t|
      t.references :tag,   index: true
      t.references :place, index: true

      t.timestamps
    end
  end
end
