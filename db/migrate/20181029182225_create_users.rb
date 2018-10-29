class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :registration
      t.string :score

      t.timestamps
    end
  end
end
