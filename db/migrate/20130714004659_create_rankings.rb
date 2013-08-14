class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references    :competition
      t.references    :week
      t.integer       :position
      t.integer       :score
      t.integer       :total

      t.timestamps
    end
  end
end
