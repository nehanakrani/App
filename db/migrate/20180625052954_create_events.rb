class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.string :description
      t.string :title
      t.integer :user_id

      t.timestamps
    end

  end
end