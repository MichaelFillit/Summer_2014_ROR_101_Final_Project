class Dtodt < ActiveRecord::Migration
  def change
  	change_column :dateranges, :datefrom, :datetime
  	change_column :dateranges, :dateto, :datetime
  end
end
