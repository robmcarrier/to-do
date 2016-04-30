class CreateList < ActiveRecord::Migration
  def change
      create_table :lists do |t|
          t.string :title
          t.string :type
      end
  end
end
