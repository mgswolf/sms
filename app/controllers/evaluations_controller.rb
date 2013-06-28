class EvaluationsController < ApplicationController
  before_filter :get_teacher, except: [:index]
  def index
    @search = Evaluation.search(params[:search], include: [:teacher, :student])
    @evaluations = @search.page(params[:page])
  end

  def show
    @evaluation = @teacher.evaluations.find(params[:id])
  end

  def new
    @evaluation  = @teacher.evaluations.build
  end

  def edit
    @evaluation = @teacher.evaluations.find(params[:id])
  end

  def create
    @evaluation = @teacher.evaluations.new(params[:evaluation])
    if @evaluation.save
      redirect_to [@teacher,@evaluation], notice: t("flash.evaluations.create.notice")
    else
      flash.now.alert = t("flash.evaluations.create.alert")
      render :new
    end
  end

  def update
    @evaluation = @teacher.evaluations.find(params[:id])
    if @evaluation.update_attributes(params[:evaluation])
      redirect_to [@teacher,@evaluation], notice: t("flash.evaluations.update.notice")
    else
      flash.now.alert = t("flash.evaluations.update.alert")
      render :edit
    end
  end

  private
    def get_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end
end