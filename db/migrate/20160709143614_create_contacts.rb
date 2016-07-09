class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firname
      t.string :lastname
      t.string :phone

      t.timestamps null: false
    end
  end
end
