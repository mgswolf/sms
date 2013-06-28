class EvaluationsController < ApplicationController
  before_filter :get_teacher, except: [:index]
  before_filter :get_evaluation, except: [:index, :new, :create]

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
    if @evaluation.update_attributes(params[:evaluation])
      redirect_to [@teacher,@evaluation], notice: t("flash.evaluations.update.notice")
    else
      flash.now.alert = t("flash.evaluations.update.alert")
      render :edit
    end
  end

  def destroy
    if @evaluation.destroy
      redirect_to evaluations_path, notice: t("flash.evaluations.destroy.notice")
    else
      redirect_to [@teacher,@evaluation], alert: t("flash.evaluations.destroy.alert")
    end
  end

  private
    def get_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end

    def get_evaluation
      @evaluation = @teacher.evaluations.find(params[:id])
    end
end