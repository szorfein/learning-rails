class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :surname
      t.string :email
      t.string :mobile
      t.text :note

      t.timestamps
    end
  end
end
