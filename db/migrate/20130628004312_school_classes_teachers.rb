class SchoolClassesTeachers < ActiveRecord::Migration
  def up
    create_table :school_classes_teachers, id: false do |t|
      t.belongs_to :school_class, null: false
      t.belongs_to :teacher, null: false
    end
    add_index :school_classes_teachers , :school_class_id
    add_index :school_classes_teachers, :teacher_id
  end

  def down
    drop_table :school_classes_teachers
    remove_index :school_classes_teachers , :school_class_id
    remove_index :school_classes_teachers, :teacher_id
  end
end
