class AddOwnerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :owner, :boolean
  end

  def self.up
    add_column :projects, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :admin
  end
  
end
