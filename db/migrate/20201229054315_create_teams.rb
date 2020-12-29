class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.string :website
      t.string :twitter
      t.string :telegram

      t.timestamps
    end


    add_column :teams, :slug, :string
    add_index :teams, :slug, unique: true

    add_column :users, :team_id, :uuid
  end
end
