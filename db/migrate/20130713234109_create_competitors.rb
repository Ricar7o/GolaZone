class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|

      t.belongs_to    :user
      t.belongs_to    :campaign

      t.timestamps
    end
  end
end
