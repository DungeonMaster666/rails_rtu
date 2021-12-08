class AddColumnsToLietotajaparametrs < ActiveRecord::Migration[6.1]
  def change
    add_column :lietotajaparametrs, :koef, :float, default: 0
    add_column :lietotajaparametrs, :goal, :float, default: 0
  end
end
