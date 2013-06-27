class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.belongs_to :school_class
      t.string :slug

      t.timestamps
    end
    add_index :students, :school_class_id
  end
end
