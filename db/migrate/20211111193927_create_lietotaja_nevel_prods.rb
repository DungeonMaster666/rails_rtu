class CreateLietotajaNevelProds < ActiveRecord::Migration[6.1]
  def change
    create_table :lietotaja_nevel_prods do |t|
      t.integer :user_id
      t.string :prod_nos

      t.timestamps
    end
  end
end
