class AddYouTubeToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :you_tube, :string
  end
end
