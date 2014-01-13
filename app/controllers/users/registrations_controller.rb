class Users::RegistrationsController < Devise::RegistrationsController

  def create
    # build_resource
    if params['premium_button']
      @user = User.new(params[:user])
      if @user.save 
        set_flash_message :notice, :signed_up
        redirect_to new_subscription_path(user_id: @user.id)
      else
        clean_up_passwords resource
        respond_with resource
        # redirect_to new_user_registration_path
      end
    else
      super
    end
  end

  def update
        # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "devise/registrations/edit"
    end
  end

  # private

  # def after_sign_in_path_for(resource_or_scope)
  #   new_subscription_path(user_id: @user.id) if params['premium_button']
  # end
end