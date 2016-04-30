class RemoveColumnList < ActiveRecord::Migration
  def change
      remove_column :lists, :time, :integer
  end
end
