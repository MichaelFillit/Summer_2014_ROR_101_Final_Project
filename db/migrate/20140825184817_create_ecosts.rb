class CreateEcosts < ActiveRecord::Migration
  def change
    create_table :ecosts do |t|
      t.date :date
      t.string :title
      t.float :ecost

      t.timestamps
    end
  end
end
