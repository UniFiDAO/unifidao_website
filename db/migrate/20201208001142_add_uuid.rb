# config/db/migrate/enable_uuid.rb
class AddUuid < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end
