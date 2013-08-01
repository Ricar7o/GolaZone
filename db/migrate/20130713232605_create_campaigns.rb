class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string      :name
      t.boolean     :published,     default: true
      t.references  :tournament
      t.integer     :number_of_matchdays
      t.integer     :win_points,    default: 3
      t.integer     :lose_points,   default: 0
      t.integer     :draw_points,   default: 1
      t.string      :contest_type
      t.integer     :person_limit

      t.timestamps
    end
  end
end
