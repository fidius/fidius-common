class CreateDefaultDefs < ActiveRecord::Migration
  def self.up
    Def.find_or_create_by_d_and_e_and_f(:d => 2, :e => 'TestD', :f => 3)
  end

  def self.down
    Def.first.destroy!
  end
end
