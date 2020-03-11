class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	#before_actionメソッドは、このコントローラが動作する前に実行される
	#:authenticate_user!はログイン認証されていなければ、ログイン画面へリダイレクトする、という機能を実装できる
	before_action :configure_permitted_parameters, if: :devise_controller?
	#devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
	#configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が行われます。
end