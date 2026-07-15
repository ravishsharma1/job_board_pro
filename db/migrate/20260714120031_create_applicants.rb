class CreateApplicants < ActiveRecord::Migration[8.1]
  def change
    create_table :applicants do |t|
      t.references :job, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :cover_letter

      t.timestamps
    end
  end
end
