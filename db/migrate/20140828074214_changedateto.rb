class Changedateto < ActiveRecord::Migration
  def change
  	rename_column :dateranges, :dateto, :dayto
  end
end
