class CreateMatches < ActiveRecord::Migration
  
  def change
    create_table :matches do |t|
      t.references  :matchday
      t.references  :home_team
      t.references  :away_team
      t.date        :match_date
      t.time        :match_time
      t.integer     :home_score
      t.integer     :away_score
      t.integer     :leg
      t.float       :home_odds
      t.float       :draw_odds
      t.float       :away_odds
      t.string      :venue

      t.timestamps
    end

    add_index :matches, [:home_team, :away_team, :date], unique: true
  end

end
