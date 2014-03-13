class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string :name
      t.integer :group_id
      t.integer :project_id

      t.timestamps
    end
  end
end
