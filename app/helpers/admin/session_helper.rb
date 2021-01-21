module Admin::SessionHelper

  def admin_log_in(admin)
    session[:admin_id] = admin.id
  end


# ここがまだわからない。
  def current_admin
    if session[:admin_id]
      # 「A ||= B」は、「A」が偽であれば「A」に「B」の内容が代入されます。
      # カレントユーザーに値が入っていなけれ代入するということか？
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  # def admin_admin
  #   if session[:admin_id]
  #     # 「A ||= B」は、「A」が偽であれば「A」に「B」の内容が代入されます。
  #     # カレントユーザーに値が入っていなけれ代入するということか？
  #     @current_admin ||= admin.find_by(id: session[:admin_id])
  #   end
  # end

  def admin_logged_in?
    !current_admin.nil?
  end

  def admin_log_out
    session.delete(:admin_id)
    @current_admin = nil
  end


end
