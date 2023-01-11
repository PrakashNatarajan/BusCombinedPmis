class CreateBusAuthProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_auth_profiles do |t|
      t.string :group_channel
      t.string :role_level
      t.string :role_user
      t.string :role_prod
      t.string :access_token
      t.datetime :expired_at

      t.timestamps
    end
  end
end
