class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime   :start_at
      t.datetime   :stop_at
      t.references :place, index: true

      t.timestamps
    end

    add_reference :places, :user, index: true
  end
end
