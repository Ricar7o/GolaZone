class CreateMatchdays < ActiveRecord::Migration
  
  def change
    create_table :matchdays do |t|
      t.references    :tournament
      t.integer       :week_number
      t.timestamps
    end

    add_index :matchdays, [:tournament_id, :week_number], unique: true
  end

end
