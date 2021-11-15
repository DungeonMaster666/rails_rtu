class CreateBazesprods < ActiveRecord::Migration[6.1]
  def change
    create_table :bazesprods do |t|
      t.string :prodnos
      t.float :nutrition1

      t.timestamps
    end
  end
end
