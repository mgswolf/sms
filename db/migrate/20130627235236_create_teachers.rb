class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :slug

      t.timestamps
    end
  end
end
