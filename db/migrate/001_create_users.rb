class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :telegram_id
      t.string :first_name
      t.string :last_name
      t.jsonb  :bot_data, default: {}
    end
  end

  def self.down
    drop_table :users
  end
end
