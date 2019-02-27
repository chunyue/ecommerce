class RenameDescriptoinInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :descriptoin, :description
  end
end
