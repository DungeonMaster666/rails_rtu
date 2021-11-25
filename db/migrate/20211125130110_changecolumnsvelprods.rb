class Changecolumnsvelprods < ActiveRecord::Migration[6.1]
  def change
    remove_column :velprods, :created_at
    remove_column :velprods, :updated_at
    remove_column :velprods, :nutrition1
    add_column :velprods, :olb, :string
    add_column :velprods, :tauki, :string
    add_column :velprods, :oglh, :string
    add_column :velprods, :kcal, :string
    add_column :velprods, :A, :string
    add_column :velprods, :B1, :string
    add_column :velprods, :B2, :string
    add_column :velprods, :C, :string
    add_column :velprods, :Ca, :string
    add_column :velprods, :P, :string
    add_column :velprods, :Fe, :string
  end
end
