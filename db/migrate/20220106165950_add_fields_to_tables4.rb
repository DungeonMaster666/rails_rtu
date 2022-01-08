class AddFieldsToTables4 < ActiveRecord::Migration[6.1]
  def change
    rename_column :bazesprods, :limit, :cena
    add_column :bazesprods, :min, :string, default: 0
    add_column :bazesprods, :max, :string, default: 300

    rename_column :velprods, :limit, :cena
    add_column :velprods, :min, :string, default: 0
    add_column :velprods, :max, :string, default: 300
  end
end
