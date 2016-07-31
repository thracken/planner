class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :text
      t.date :due_date
      t.time :due_time
      t.boolean :completed
      t.string :context

      t.timestamps null: false
    end
  end
end
