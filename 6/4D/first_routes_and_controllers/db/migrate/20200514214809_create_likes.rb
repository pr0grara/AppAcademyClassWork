class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :likeable_type 
      t.integer :likeable_id
      t.integer :user_id
      t.timestamps
    end
    add_index :likes, [:likeable_type, :likeable_id] #unique: true ???
    #add_index :artworks, [:artist_id, :title], unique: true
    # add_index :likes, :user_id forgot to save before migrating again XD
  end
end
