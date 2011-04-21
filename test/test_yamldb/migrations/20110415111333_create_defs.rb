class CreateDefs < ActiveRecord::Migration
  def self.up
    create_table :defs do |t|
      t.integer :d
      t.string :e
      t.integer :f

      t.timestamps
    end

  end

  def self.down
    drop_table :defs
  end
end
