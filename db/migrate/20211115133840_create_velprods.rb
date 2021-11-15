class CreateVelprods < ActiveRecord::Migration[6.1]
  def change
    create_table :velprods do |t|
      t.integer :user_id
      t.string :prod_nos
      t.string :nutrition1

      t.timestamps
    end
  end
end
