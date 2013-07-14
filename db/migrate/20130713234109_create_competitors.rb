class CreateCompetitors < ActiveRecord::Migration
  
  def change
    create_table :competitors do |t|

      t.belongs_to    :user
      t.belongs_to    :campaign

      t.timestamps
    end

    add_index :competitors, [:user_id, :campaign_id], :unique => true
  end

end
