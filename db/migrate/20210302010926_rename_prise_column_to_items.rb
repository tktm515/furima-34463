class RenamePriseColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prise, :price
  end
end
