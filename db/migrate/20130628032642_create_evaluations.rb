class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :student, null: false
      t.references :teacher, null: false
      t.decimal :grade, :precision => 6, :scale => 2
      t.date :evaluation_date
      t.string :title

      t.timestamps
    end
    add_index :evaluations, :student_id
    add_index :evaluations, :teacher_id
  end
end
