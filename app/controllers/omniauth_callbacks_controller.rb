class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  %w(facebook google_oauth2).each do |provider|
    define_method provider do
      @user = User.from_omniauth request.env["omniauth.auth"]
      @user ||= current_user

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success,
          kind: provider.capitalize) if is_navigational_format?
      else
        redirect_to new_user_registration_url
      end
    end
  end
end
