class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :discord, :string
    add_column :users, :github, :string
    add_column :users, :uniswap_pool, :string
    add_column :users, :description, :string

    add_column :teams, :discord, :string
    add_column :teams, :github, :string
    add_column :teams, :uniswap_pool, :string
    add_column :teams, :description, :string
  end
end
