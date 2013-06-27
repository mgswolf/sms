class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name, null: false
      t.string :slug
      t.timestamps
    end
  end
end
