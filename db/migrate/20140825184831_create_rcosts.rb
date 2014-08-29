class CreateRcosts < ActiveRecord::Migration
  def change
    create_table :rcosts do |t|
      t.date :date
      t.string :title
      t.float :rcost

      t.timestamps
    end
  end
end
