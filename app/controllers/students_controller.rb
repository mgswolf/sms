class StudentsController < ApplicationController
  before_filter :get_student, only: [:show, :edit, :update, :destroy]

  def index
    @search = Student.search(params[:search])
    @students = @search.page(params[:page])
  end

  def show
  end

  private
    def get_student
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to students_path, notice: t("flash.students.not_found")
    end

end