# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    flash[:after_new] = flash[:before_new]  if flash[:before_new]
    super
  end

  # POST /resource/sign_in
  def create
    @after_new = flash[:after_new]
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end
  
  def after_sign_in_path_for(resource)
    if @after_new
      flash[:notice] = "ログインに成功しました" 
      new_video_path
    else
      root_path
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
