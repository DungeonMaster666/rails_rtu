class AddLimitToBazesprods < ActiveRecord::Migration[6.1]
  def change
    add_column :bazesprods, :limit, :string, default: "0"
    add_column :velprods, :limit, :string, default: "0"
  end
end
