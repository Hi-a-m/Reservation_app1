class UsersController < ApplicationController
  
#ユーザーページのために、deviseと別でUsersコントローラーを作成

  def show
    @user = User.find(params[:id])
  end

  def edit
    # 編集するユーザーが本人じゃない場合はユーザーページにリダイレクトする
    # これをしないと、ログインさえしていれば、"/users/5/edit"みたいな適当なurlにアクセスすると、他の人のプロフィール編集画面を表示できてしまう
    unless @user == current_user
    end
  end

  private

  def set_user
    @user = User.find([:id])
  end

  def user_params
    params.require(:user).permit(:name, :icon) # 変更後

  #def user_params
    #params.fetch(:user, {}).permit(:name)
  end
end
