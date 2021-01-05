module SessionHelper

	def log_in(user)
		session[:user_id] = user.id
	end


# ここがまだわからない。
	def current_user
		if session[:user_id]
			# 「A ||= B」は、「A」が偽であれば「A」に「B」の内容が代入されます。
			# カレントユーザーに値が入っていなけれ代入するということか？
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end


end
