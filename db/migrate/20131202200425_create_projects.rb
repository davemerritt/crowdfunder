class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :goal
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
