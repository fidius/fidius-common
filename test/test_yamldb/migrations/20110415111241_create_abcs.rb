class CreateAbcs < ActiveRecord::Migration
  def self.up
    create_table :abcs do |t|
      t.string :a
      t.integer :b
      t.string :c

      t.timestamps
    end

    Abc.find_or_create_by_a_b_c(:a => 'TestA', :b => 1, :c => "TestC")
  end

  def self.down
    drop_table :abcs
  end
end
