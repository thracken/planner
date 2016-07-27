class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :outcome
      t.date :due_date
      t.time :due_time
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
