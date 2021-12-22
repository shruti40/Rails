class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string "first_name"
      t.string "last_name"
      t.datetime "date_of_birth"
      t.string "email", unique: true
      t.string "phone_no"
      t.string "password_digest"

      t.timestamps
    end
  end
end
