class AddBringerToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :bringer, :string
  end
end
