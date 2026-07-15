class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
