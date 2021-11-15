class CreateLietotajaParametrs < ActiveRecord::Migration[6.1]
  def change
    create_table :lietotaja_parametrs do |t|
      t.float :svars
      t.integer :augums
      t.integer :vecums
      t.string :dzimums
      t.integer :user_id

      t.timestamps
    end
  end
end
