module SessionsHelper

#        ↓sessionメソッドを使ってcookiesにuser_idを保存することでログイン中とわかる
	def log_in(user)
		session[:user_id] = user.id
	end
# いちいちsession[:user_id]でログイン中のユーザーを検索するのは面倒なので定義しておく
	def current_user
	    if session[:user_id]
	      @current_user ||= User.find_by(id: session[:user_id])
	    end
	end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
	def logged_in?
	    !current_user.nil?
	end

	def log_out
	    session.delete(:user_id)
	    @current_user = nil
	end
end