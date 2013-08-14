class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references    :user
      t.references    :campaign
      t.string        :to_name
      t.string        :to_email
      t.text          :message

      t.timestamps
    end
  end
end
