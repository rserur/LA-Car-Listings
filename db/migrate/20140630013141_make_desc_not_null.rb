class MakeDescNotNull < ActiveRecord::Migration
  def up
    change_column :cars, :description, :text, null: true
  end

  def down
    change_column :cars, :description, :text, null: false
  end
end
