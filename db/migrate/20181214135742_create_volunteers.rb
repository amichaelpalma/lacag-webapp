class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cp_number
      t.string :alt_cp_number
      t.string :location
      t.timestamps
    end
  end
end
