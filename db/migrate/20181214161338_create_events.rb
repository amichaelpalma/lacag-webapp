class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      #will have many photo
      t.string :title
      t.string :subtitle
      t.string :tag
      t.text :details
    end
  end
end
