class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :profile_url
      t.string :provider
      t.string :uid
      t.integer :gender

      t.timestamps
    end

    add_index :users, :uid, unique: true
    add_index :users, %i[uid provider]
  end
end
