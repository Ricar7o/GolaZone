class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references  :home_team
      t.references  :away_team
      t.date        :match_date
      t.time        :match_time
      t.integer     :home_score
      t.integer     :away_score
      t.integer     :leg
      t.float       :odds
      t.string      :venue

      t.timestamps
    end
  end
end
