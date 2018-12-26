class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cp_number
      t.string :location
      t.timestamps
    end
  end
end
