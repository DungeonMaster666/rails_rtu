class CreateEdienkartes < ActiveRecord::Migration[6.1]
  def change
    create_table :edienkartes do |t|
      t.integer :user_id
      t.string :prodnos
      t.float :nutrition1
      t.string :shopnos
      t.string :cena
      t.string :linktophoto
      t.string :quantity

      t.timestamps
    end
  end
end
