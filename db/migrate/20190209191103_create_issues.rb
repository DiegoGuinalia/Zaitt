class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :action
      t.integer :repository_id
      t.string :title
      t.integer :issue_id
      t.string :owner_name
      t.string :repository_name

      t.timestamps null: false
    end
  end
end
