class AddRowOrderToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :row_order, :integer
  end
end
