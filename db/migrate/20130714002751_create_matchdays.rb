class CreateMatchdays < ActiveRecord::Migration
  
  def change
    create_table :matchdays do |t|
      t.references    :tournament
      t.references    :match
      t.integer       :week_number
      t.timestamps
    end

    add_index :matchdays, [:tournament, :match, :week_number], unique: true
  end

end
