class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
    @sections = @course.sections.all
  end

  def create
    @course = Course.new(course_params)
    @course.admin_id = current_admin.id
    if @course.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_courses_url
    else
      flash[:danger] = "入力に誤りがあります"
      render 'new'
    end
  end

  def edit
      @course = Course.find(params[:id])
    end

    def update
      @course = Course.find(params[:id])
      if @course.update_attributes(course_params)
        flash[:success] = "更新に成功しました"
        redirect_to  admin_course_url
      else
        flash[:danger] = "入力に誤りがあります"
        render 'edit'
      end
    end

    def destroy
      Course.find(params[:id]).destroy
      flash[:success] = "削除しました"
      redirect_to admin_courses_url
    end

private

  def course_params
    params.require(:course).permit(:course_image, :digest_movie_url, :title, :introduce, :image)
  end

end

