class AddInvestorFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :string

    add_column :users, :name, :string
    add_column :users, :fund, :string
    add_column :users, :website, :string
    add_column :users, :partner, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
    add_column :users, :telegram, :string
  end
end
