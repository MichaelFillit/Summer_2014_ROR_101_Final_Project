class CreateDateranges < ActiveRecord::Migration
  def change
    create_table :dateranges do |t|
      t.string :year
      t.string :month
      t.string :day

      t.timestamps
    end
  end
end
