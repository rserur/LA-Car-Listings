class ChangeYearDataType < ActiveRecord::Migration
  def up
    remove_column :cars, :year
    add_column :cars, :year, :integer
  end

  def down
    remove_column :cars, :year
    add_column :cars, :year, :date
  end
end
