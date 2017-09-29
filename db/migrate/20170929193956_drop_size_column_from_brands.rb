class DropSizeColumnFromBrands < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :size)
  end
end
