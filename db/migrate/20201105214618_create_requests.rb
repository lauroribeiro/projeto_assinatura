class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :docname
      t.string :attachment
      t.string :state
      t.timestamps
    end
  end
end
