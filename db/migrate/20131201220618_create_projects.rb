class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.text :body
      t.integer :user_id

      t.timestamps
    end

    add_index :projects, :user_id
  end
end
