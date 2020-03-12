class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.text :description
      t.integer :stars
      t.integer :forks
      t.string :author

      t.timestamps
    end
  end
end
