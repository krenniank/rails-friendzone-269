class RenameLocationInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :location, :address
  end
end
