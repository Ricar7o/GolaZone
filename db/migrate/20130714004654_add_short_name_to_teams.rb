class AddShortNameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :short_name, :string
    add_column :teams, :country, :string
  end
end
