class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.datetime :date
      t.string :place

      t.timestamps
    end
  end
end
