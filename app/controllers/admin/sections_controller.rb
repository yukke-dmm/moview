class Admin::SectionsController < ApplicationController
 before_action :logged_in_admin

  def index
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_course_url(@section.course_id)
    else
      render 'new'
    end
  end

  def show
    @section = Section.includes(:lectures).find(params[:section_id])
    @course = Course.find(@section.course_id)
    @sections = @course.sections.all
    @lecture = Lecture.find(params[:lecture_id])
    # @lectures = @section.lectures.all

    @lecture_ids = @section.lectures.map{ |lecture| lecture.id }
    @lecture_index = @lecture_ids.index(@lecture.id)
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_course_url(@section.course_id)
    else
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:success] = "削除しました"
    redirect_to admin_course_url(@section.course_id)
  end

private

  def section_params
    params.require(:section).permit(:title, :introduce,:course_id)
  end

  def logged_in_admin
    unless admin_logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to admin_login_url
    end
  end


end
