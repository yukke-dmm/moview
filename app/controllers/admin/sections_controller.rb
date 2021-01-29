class Admin::SectionsController < ApplicationController
 before_action :logged_in_admin

  def index
  end

  def new
    @section = Section.new
    @course = Course.find(params[:course_id])
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
    # rankは並べ替えなので注意
    @lecture = Lecture.find(params[:lecture_id])
    # ここで選択中のセクション配下のレクチャーのIDだけを抽出した配列を作成する。
    # 書き方　・・・　配列の入った変数.map {|変数名| 処理内容 }
    @lecture_ids = @section.lectures.map{ |lecture| lecture.id }
    #さらにこれで、選択中のレクチャーが①で作成した配列の何番目にあるのかを取得してます
    @lecture_index = @lecture_ids.index(@lecture.id)
  end

  def edit
    @section = Section.find(params[:id])
    @lectures = @section.lectures.rank(:row_order)
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

  # this action will be called via ajax
  def sort
    lecture = Lecture.find(params[:lecture_id])
    lecture.update(lecture_params)
    render body: nil
  end


private

  def section_params
    params.require(:section).permit(:title, :introduce,:course_id,lecture_attributes: [:sort])
  end

  def lecture_params
    params.require(:lecture).permit(:title, :introduce,:section_id,:lecture_number,:lecture_movie_url,:row_order_position)
  end

  def logged_in_admin
    unless admin_logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to admin_login_url
    end
  end


end
