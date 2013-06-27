class HomeController < ApplicationController
  def index
    @school_classes = SchoolClass.recent
    @students = Student.recent
  end
end