class SectionsController < ApplicationController
 before_action :logged_in_user


  def index
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "登録に成功しました"
      redirect_to sections_url
    else
      render 'new'
    end
  end

  def show
    @section = Section.find(params[:id])
    # @lectures = @section.lectures.all
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "更新に成功しました"
      redirect_to @section
    else
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:success] = "削除しました"
    redirect_to course_url(@section.course_id)
  end

private

  def section_params
    params.require(:section).permit(:title, :introduce,:course_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end


end
