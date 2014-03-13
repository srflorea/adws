class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :number
      t.string :state
      t.string :problem
      t.string :description
      t.string :arguments
      t.integer :iteration_id
      t.integer :decision_id

      t.timestamps
    end
  end
end
