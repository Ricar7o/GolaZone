class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references    :competition
      t.references    :week
      t.integer       :position,    default: 1
      t.integer       :score,       default: 0
      t.integer       :total,       default: 0

      t.timestamps
    end
  end
end
