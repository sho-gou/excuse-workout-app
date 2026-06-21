class ProfilesController < ApplicationController
    before_action :require_login
    before_action :set_profile, only: %i[show edit update]

    def show; end
    def edit; end

    def update
        if @profile.update(profile_params)
            redirect_to profile_path, notice: "活動目標を更新しました"
        else
            flash.now[:alert] = "活動目標の更新に失敗しました"
            render :edit, status: :unprocessable_entity
        end
    end

    private

    # データを準備する、現在ログインしている人のプロフィールを探す
    # なければ、その人のプロフィールの箱を準備する。
    def set_profile
        @profile = current_user.profile || current_user.build_profile
    end

    # セキュリティ　「fitness_goal」と「tiny_menu」という項目だけ入力を許可する。
    def profile_params
        params.require(:profile).permit(:fitness_goal, :tiny_menu)
    end
end
