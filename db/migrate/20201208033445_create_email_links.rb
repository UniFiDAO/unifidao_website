class CreateEmailLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :email_links, id: :uuid do |t|
      t.string :token
      t.datetime :expires_at
      t.references :user,  null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
