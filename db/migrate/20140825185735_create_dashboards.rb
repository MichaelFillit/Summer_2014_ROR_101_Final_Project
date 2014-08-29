class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
