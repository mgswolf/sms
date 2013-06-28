# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130628032642) do

  create_table "evaluations", :force => true do |t|
    t.integer  "student_id",                                    :null => false
    t.integer  "teacher_id",                                    :null => false
    t.decimal  "grade",           :precision => 6, :scale => 2
    t.date     "evaluation_date"
    t.string   "title"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "evaluations", ["student_id"], :name => "index_evaluations_on_student_id"
  add_index "evaluations", ["teacher_id"], :name => "index_evaluations_on_teacher_id"

  create_table "school_classes", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "school_classes_teachers", :id => false, :force => true do |t|
    t.integer "school_class_id", :null => false
    t.integer "teacher_id",      :null => false
  end

  add_index "school_classes_teachers", ["school_class_id"], :name => "index_school_classes_teachers_on_school_class_id"
  add_index "school_classes_teachers", ["teacher_id"], :name => "index_school_classes_teachers_on_teacher_id"

  create_table "students", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "school_class_id"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "students", ["school_class_id"], :name => "index_students_on_school_class_id"

  create_table "teachers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
