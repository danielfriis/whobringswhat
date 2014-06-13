class RenameBringerToPickerForTask < ActiveRecord::Migration
  def change
    rename_column :tasks, :bringer, :picker
  end
end
