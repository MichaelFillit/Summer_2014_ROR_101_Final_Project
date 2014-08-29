class CreateRincomes < ActiveRecord::Migration
  def change
    create_table :rincomes do |t|
      t.date :date
      t.string :title
      t.float :rincome

      t.timestamps
    end
  end
end
