class AddColumnsToBazesprods < ActiveRecord::Migration[6.1]
  def change
    remove_column :bazesprods, :nutrition1
    add_column :bazesprods, :olb, :string
    add_column :bazesprods, :tauki, :string
    add_column :bazesprods, :oglh, :string
    add_column :bazesprods, :kcal, :string
    add_column :bazesprods, :A, :string
    add_column :bazesprods, :B1, :string
    add_column :bazesprods, :B2, :string
    add_column :bazesprods, :C, :string
    add_column :bazesprods, :Ca, :string
    add_column :bazesprods, :P, :string
    add_column :bazesprods, :Fe, :string
  end
end
