class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :full_name
    end
  end

  def self.down
    drop_table :users
  end
end
