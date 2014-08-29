class CreateDaters < ActiveRecord::Migration
  def change
    create_table :daters do |t|
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
