class AddSentToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :sent, :bolean
  end
end
