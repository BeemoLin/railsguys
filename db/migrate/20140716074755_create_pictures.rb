class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :photo
      t.integer :post_id

      t.timestamps
    end
  end
end
