class AddReasonSignedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reason, :text
    add_column :users, :signed, :boolean
  end
end
