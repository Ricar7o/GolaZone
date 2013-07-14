class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references    :competitor
      t.references    :match
      t.integer       :selected_result

      t.timestamps
    end

    add_index :picks, [:competitor_id, :match_id], unique: true
  end

end
