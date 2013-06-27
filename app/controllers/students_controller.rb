class StudentsController < ApplicationController
  before_filter :get_student, only: [:show, :edit, :update, :destroy]

  def index
    @search = Student.search(params[:search])
    @students = @search.page(params[:page])
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student, notice: t("flash.students.create.notice")
    else
      flash.now.alert = t("flash.students.create.alert")
      render :new
    end
  end

  def update
    if @student.update_attributes(params[:student])
      redirect_to @student, notice: t("flash.students.update.notice")
    else
      flash.now.alert = t("flash.students.update.alert")
      render :edit
    end
  end

  private
    def get_student
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to students_path, notice: t("flash.students.not_found")
    end

end