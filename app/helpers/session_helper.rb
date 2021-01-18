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

	# def admin_user
	# 	if session[:admin_id]
	# 		# 「A ||= B」は、「A」が偽であれば「A」に「B」の内容が代入されます。
	# 		# カレントユーザーに値が入っていなけれ代入するということか？
	# 		@current_user ||= User.find_by(id: session[:user_id])
	# 	end
	# end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end



# ーーーーーーーーーーーここからアドミンーーーーーーーーーーーー

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
	# 	if session[:admin_id]
	# 		# 「A ||= B」は、「A」が偽であれば「A」に「B」の内容が代入されます。
	# 		# カレントユーザーに値が入っていなけれ代入するということか？
	# 		@current_admin ||= admin.find_by(id: session[:admin_id])
	# 	end
	# end

	def admin_logged_in?
		!current_admin.nil?
	end

	def admin_log_out
		session.delete(:admin_id)
		@current_admin = nil
	end



end
