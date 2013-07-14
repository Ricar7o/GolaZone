class CreateMatchdays < ActiveRecord::Migration
  def change
    create_table :matchdays do |t|
      t.references    :tournament
      t.references    :match
      t.integer       :week_number
      t.timestamps
    end
  end
end
