class CreateTeams < ActiveRecord::Migration
  
  def change
    create_table :teams do |t|
      t.string      :name
      t.string      :home_field
      t.string      :shape
      t.string      :sport
      
      t.timestamps
    end

    add_index :teams, [:name, :sport], unique: true
  end

end
