require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
	  # サインアップパスに移動
	  get signup_path
	  # 以下のことを実行してユーザーカウントが「変わらないよ」というテスト
	  assert_no_difference 'User.count' do
	  	# 登録するユーザーはこれ。名前は空欄だし、アドレス間違い、パスワード間違いで引っかかるので登録数は増えない。
	  	post users_path, params:{user:{ name:"",email:"user@invalid",password:"foo",password_confirmation:"bar"}}
	  end
	  assert_template 'users/new'
	  assert_select 'div#error_explanation'
	  assert_select 'div.alert'
  end

  test "valid signup information" do
  	get signup_path
  	assert_difference 'User.count', 1 do
  		post users_path,params:{user:{name: "Example User",email: "user@example.com",password:"password",password_confirmation:"password"}}
  	end
  	# ↓ POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
  	follow_redirect!
  	assert_template 'users/show'
    assert is_logged_in?
      	# assert flash.any?でもいけるのかな？
  	assert_not flash.empty?
  	assert flash.any?
  end


end
