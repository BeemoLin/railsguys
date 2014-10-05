class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :start_date, :date
  end
end
