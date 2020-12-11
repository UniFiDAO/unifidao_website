class AddPathToEmailLink < ActiveRecord::Migration[6.0]
  def change
    add_column :email_links, :path, :string, default: nil
  end
end
