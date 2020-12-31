class AddYouTubeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :you_tube, :string
  end
end
