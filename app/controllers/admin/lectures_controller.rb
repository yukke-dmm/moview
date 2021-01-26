class Admin::LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_course_url(@lecture.section.course_id)
    else
      render 'new'
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(lecture_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_course_url(@lecture.section.course_id)
    else
      render 'edit'
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    flash[:success] = "削除しました"
    redirect_to admin_course_url(@lecture.section.course_id)
  end

  def sort
    lecture = Lecture.find(params[:lecture_id])
    lecture.update(lecture_params)
    render body: nil
  end

private

  def lecture_params
    params.require(:lecture).permit(:title, :introduce,:section_id,:lecture_number,:lecture_movie_url,:row_order_position)
  end


  def logged_in_admin
    unless admin_logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end
