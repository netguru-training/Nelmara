class UsersController < Devise::RegistrationsController

  def create
    super
    attach_avatar if @user.persisted?
  end

  def update
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, :bypass => true)
      redirect_to root_url, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def finish_signup
    if request.patch? && params[:user]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_url, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private

    def attach_avatar
      @user.remote_avatar_url = Faker::Avatar.image
      @user.save
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :avatar ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end

