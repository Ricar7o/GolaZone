class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references    :competitor
      t.references    :matchday
      t.integer       :selected_result

      t.timestamps
    end
  end
end
