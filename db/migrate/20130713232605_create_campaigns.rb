class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string      :name
      t.boolean     :published
      t.references  :tournament
      t.integer     :number_of_matchdays
      t.integer     :win_points
      t.integer     :lose_points
      t.integer     :draw_points
      t.string      :contest_type
      t.integer     :person_limit

      t.timestamps
    end
  end
end
