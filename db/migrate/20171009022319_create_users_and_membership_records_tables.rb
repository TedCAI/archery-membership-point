class CreateUsersAndMembershipRecordsTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :email
      t.string :token

      t.timestamps
    end

    create_table :membership_records do |t|
      t.integer :user_id
      t.integer :previous_id
      t.datetime :record_time

      t.timestamps
    end

    create_table :membership_score_policies do |t|
      t.string :name
      t.string :slug
      t.integer :score

      t.timestamps
    end

    create_table :membership_record_details do |t|
      t.integer :membership_record_id
      t.integer :membership_score_policy_id
    end
  end
end
