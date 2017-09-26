class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
