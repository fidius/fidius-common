class CreateDefaultAbcs < ActiveRecord::Migration
  def self.up
    Abc.find_or_create_by_a_and_b_and_c(:a => 'TestA', :b => 1, :c => "TestC")
  end

  def self.down
    Abc.first.destroy!
  end
end
