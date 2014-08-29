class CreateEincomes < ActiveRecord::Migration
  def change
    create_table :eincomes do |t|
      t.date :date
      t.string :title
      t.float :eincome

      t.timestamps
    end
  end
end
