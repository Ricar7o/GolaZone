class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references    :competition
      t.references    :match
      t.string        :selected_result

      t.timestamps
    end

    add_index :picks, [:competition_id, :match_id], unique: true
  end

end
