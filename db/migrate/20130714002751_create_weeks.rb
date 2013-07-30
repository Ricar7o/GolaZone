class CreateWeeks < ActiveRecord::Migration

  def change
    create_table :weeks do |t|
      t.references    :tournament
      t.integer       :week_number
      t.datetime      :earliest_match,    default: Time.new(9999)
      t.datetime      :latest_match,      default: Time.at(0)
      t.boolean       :rescheduled_matches, default: false
      t.timestamps
    end

    add_index :weeks, [:tournament_id, :week_number], unique: true
  end

end
