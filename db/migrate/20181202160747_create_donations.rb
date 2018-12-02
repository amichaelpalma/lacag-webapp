class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :item_name
      t.text :item_description
    end
  end
end
