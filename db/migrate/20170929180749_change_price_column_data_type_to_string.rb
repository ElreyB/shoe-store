class ChangePriceColumnDataTypeToString < ActiveRecord::Migration[5.1]
  def change
    change_column(:brands, :price, :string)
  end
end
