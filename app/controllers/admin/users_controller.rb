class Admin::UsersController < ApplicationController
# before_action :logged_in_user
# before_action :correct_user,   only: [:edit, :update]
before_action :admin_user

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @courses = Course.all
    @checked_lectures = IsCompletedLecture.where(user_id: params[:id])
    @checked = IsCompletedLecture.where(user_id: params[:id]).order(created_at: :desc).limit(1) # IsCompletedLecture をwhere で対象のユーザーに絞り込み、order(created_at: :desc)で新しい順に並び替え、limit で1つだけ取り出します
  end

# course,user_id が引数
  def completed_lecture(course, user_id)
    completed_lecture_count = 0
    course.sections.each do |section|
      completed_lectures = section.lectures.select{ |lecture| lecture.is_completed_lectures }
      completed_lectures.each do |lecture|
        completed_lecture_count += lecture.is_completed_lectures.where(user_id: user_id).length
      end
    end
    return completed_lecture_count
    # view側から呼び出す関数
    # course情報 を引数で渡す
    # course内の 各section の lecture で、is_completed_lectures が存在するものをselectで抽出
    # 抽出したものからさらに選択中のuser_idのものだけ抽出
  end

  def latest_completed_lecture_date(course, user_id)
    logger.debug('gggggggggggggggggg')
    latest_completed_lectures = []
    course.sections.each do |section|
      section.lectures.each do |lecture|
        if lecture.is_completed_lectures.present?
          latest_completed_lectures.push(lecture.is_completed_lectures)
        end
      end
    end
    if latest_completed_lectures.length > 0
      latest_completed_lectures.each do |latest_completed_lecture|
        if latest_completed_lecture.where(user_id: user_id).order(created_at: :desc).limit(1)[0]
          return latest_completed_lecture.where(user_id: user_id).order(created_at: :desc).limit(1)[0].created_at.strftime('%Y/%m/%d %H:%M:%S')
        else
          return '完了したレクチャーはまだありません'
        end
      end
    end
  # ①latest_completed_lectures = []　　空配列を定義

  # ②前述の　def completed_lecture　と同様、
  # course内の 各section の lecture で、is_completed_lectures が存在するものを　latest_completed_lectures 　に格納していく

  # ③格納したものから、選択中のuser_id 存在するもののみを抽出し、作成日順にならびかえ、最新のものを１つ抽出
  # ③が存在すれば、それのcreated_atを返す
  # 　存在しなければ、'完了したレクチャーはまだありません'　を返す
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to admin_users_url
  end


private
  def user_params
    params.require(:user).permit(:name,:email,:employee_number,:password,:password_confirmation)
    # params.permit(:name,:email,:employee_number,:password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

    # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_admin.admin?
  end

      # 正しいユーザーかどうか確認
  def correct_user
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless @admin == admin_user
    # redirect_to(root_url) unless current_user?(@user)
    # ここをアドミンでしかできないようにするには・・・どうする？
  end

  helper_method :completed_lecture
  helper_method :latest_completed_lecture_date


end