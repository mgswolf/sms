class SchoolClassesController < ApplicationController
  before_filter :get_school_class, only: [:show, :edit, :update, :destroy]

  def index
    @search = SchoolClass.search(params[:search])
    @school_classes = @search.page(params[:page])
  end

  def show
  end

  def new
    @school_class = SchoolClass.new
  end

  def edit
  end

  def create
    @school_class = SchoolClass.new(params[:school_class])
    if @school_class.save
      redirect_to @school_class, notice: t("flash.school_classes.create.notice")
    else
      flash.now.alert = t("flash.school_classes.create.alert")
      render :new
    end
  end

  def update
    if @school_class.update_attributes(params[:school_class])
      redirect_to @school_class, notice: t("flash.school_classes.update.notice")
    else
      flash.now.alert = t("flash.school_classes.update.alert")
      render :edit
    end
  end

  def destroy
    if @school_class.destroy
      redirect_to school_classes_path, notice: t("flash.school_classes.destroy.notice")
    else
      redirect_to @school_class, alert: t("flash.school_classes.destroy.alert")
    end
  end

  private
    def get_school_class
      @school_class = SchoolClass.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to school_classes_path, alert: t("flash.school_classes.not_found")
    end
end