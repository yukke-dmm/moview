class LecturesController < ApplicationController
  def new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:success] = "登録に成功しました"
      redirect_to lectures_url
    else
      render 'new'
    end
  end

  def edit
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(lecture_params)
      flash[:success] = "更新に成功しました"
      redirect_to @lecture
    else
      render 'edit'
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    flash[:success] = "削除しました"
    redirect_to course_url(@lecture.section_id)
  end

private

  def lecture_params
    params.require(:lecture).permit(:title, :introduce,:section_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end
