class Core::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    sign_in_and_redirect user, event: :authentication

    set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  end

  def google_oauth2
    sign_in_and_redirect user, event: :authentication

    set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
  end

  def failure
    redirect_to root_path
  end

  private

  def user
    @user ||=
      Core::User::FindBySocialProvider.(provider_adapter) ||
      Core::User::FindByEmailAndAddProvider.(provider_adapter) ||
      Core::User::CreateBySocialProvider.(provider_adapter)
  end

  def provider_adapter
    @provider_adapter ||= Core::Social.build_adapter(request.env['omniauth.auth'])
  end
end
