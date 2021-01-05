ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  	# セッションのに入っているユーザーidはからではないですか？
  def is_logged_in?
    !session[:user_id].nil?
  end
# これがあることでログインが継続しているかテストで確認できる。



  # Add more helper methods to be used by all tests here...
end
