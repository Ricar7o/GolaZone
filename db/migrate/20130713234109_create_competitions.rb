class CreateCompetitions < ActiveRecord::Migration

  def change
    create_table :competitions do |t|

      t.belongs_to    :user
      t.belongs_to    :campaign

      t.timestamps
    end

    add_index :competitions, [:user_id, :campaign_id], :unique => true
  end

end
