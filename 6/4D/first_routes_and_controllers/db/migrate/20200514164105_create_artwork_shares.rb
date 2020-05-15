class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      # t.integer :artwork_id, null: false
      # t.integer :viewer_id, null: false  forgot to save migration before migrating!!

      t.timestamps
    end
  
  end
end
