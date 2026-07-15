class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :salary
      t.string :location
      t.string :employment_type
      t.string :experience_level

      t.timestamps
    end
  end
end
