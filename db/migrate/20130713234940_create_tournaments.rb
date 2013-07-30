class CreateTournaments < ActiveRecord::Migration

  def change
    create_table :tournaments do |t|
      t.string      :name
      t.string      :organizer
      t.integer     :number_of_weeks
      t.string      :sport
      t.string      :competition_style
      t.string      :season
      t.string      :country
      t.timestamps
    end

    add_index :tournaments, [:name, :sport, :season], unique: true
  end

end
