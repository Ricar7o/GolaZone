class CreateParticipants < ActiveRecord::Migration
  
  def change
    create_table :participants do |t|
      t.references  :tournament
      t.references  :team
      t.timestamps
    end

    add_index :participants, [:tournament_id, :team_id], :unique => true
  end

end
