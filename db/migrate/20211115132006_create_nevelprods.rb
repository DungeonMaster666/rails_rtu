class CreateNevelprods < ActiveRecord::Migration[6.1]
  def change
    create_table :nevelprods do |t|
      t.integer :user_id
      t.string :prod_nos

      t.timestamps
    end
  end
end
