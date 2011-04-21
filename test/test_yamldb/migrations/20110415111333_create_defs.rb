class CreateDefs < ActiveRecord::Migration
  def self.up
    create_table :defs do |t|
      t.integer :d
      t.string :e
      t.integer :f

      t.timestamps
    end

    Def.find_or_create_by_d_e_f(:d => 2, :e => 'TestD', :f => 3)
  end

  def self.down
    drop_table :defs
  end
end
