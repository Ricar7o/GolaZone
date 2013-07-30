class CreateMatches < ActiveRecord::Migration

  def change
    create_table :matches do |t|
      t.references  :week
      t.references  :home_team
      t.references  :away_team
      t.datetime    :match_time
      t.boolean     :postponed,   default: false
      t.integer     :home_score
      t.integer     :away_score
      t.integer     :leg
      t.float       :home_odds
      t.float       :draw_odds
      t.float       :away_odds
      t.string      :venue

      t.timestamps
    end

    add_index :matches, [:home_team_id, :away_team_id, :match_time], unique: true
  end

end