class Changecolumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :bazesprods, :created_at
    remove_column :bazesprods, :updated_at


  end
end
