class TeachersController < ApplicationController
  before_filter :get_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @search = Teacher.search(params[:search])
    @teachers = @search.page(params[:page])
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      redirect_to @teacher, notice: t("flash.teachers.create.notice")
    else
      flash.now.alert = t("flash.teachers.create.alert")
      render :new
    end
  end

  private
    def get_teacher
      @teacher = Teacher.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to teachers_path, alert: t("flash.teachers.not_found")
    end
end