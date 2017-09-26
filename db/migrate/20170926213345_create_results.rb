class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :reps
      t.integer :weight
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
