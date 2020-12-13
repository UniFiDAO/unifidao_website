class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.integer :duration
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
