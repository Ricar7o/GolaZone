class CreateCompetitors < ActiveRecord::Migration
  
  def change
    create_table :competitors do |t|

      t.belongs_to    :user
      t.belongs_to    :campaign

      t.timestamps
    end

    add_index :competitors, [:user, :campaign], :unique => true
  end

end
