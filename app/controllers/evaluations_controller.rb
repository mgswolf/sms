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

  def create
    @evaluation = @teacher.evaluations.new(params[:evaluation])
    if @evaluation.save
      redirect_to [@teacher,@evaluation], notice: t("flash.evaluations.create.notice")
    else
      flash.now.alert = t("flash.evaluations.create.alert")
      render :new
    end
  end

  private
    def get_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end
end