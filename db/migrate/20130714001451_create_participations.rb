class CreateParticipations < ActiveRecord::Migration

  def change
    create_table :participations do |t|
      t.references  :tournament
      t.references  :team
      t.timestamps
    end

    add_index :participations, [:tournament_id, :team_id], :unique => true
  end

end
