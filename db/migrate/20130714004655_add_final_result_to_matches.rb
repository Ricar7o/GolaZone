class AddFinalResultToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :final_result, :string
  end
end
