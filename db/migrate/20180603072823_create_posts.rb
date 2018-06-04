class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.boolean :arrive
      t.integer :pid
      t.timestamps
    end
  end
end
