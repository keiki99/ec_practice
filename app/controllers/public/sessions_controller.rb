# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_customer #ログイン画面で入力された情報が、過去に退会処理した顧客のものかどうか判断するメソッド
    customer = Customer.find_by(email: params[:customer][:email])

    return if customer.nil?
    return unless customer.valid_password?(params[:customer][:password])

      if (customer.valid_password?(params[:customer][:password]) && (customer.active_for_authentication? == false))
        flash[:alert] = "退会済みのアカウントです。別のメールアドレスを用いて新規登録してください。"
        redirect_to new_customer_registration_path
      end

  end

  def after_sign_in_path_for(resource) #ログイン後の遷移先を設定
    root_path
  end

  def after_sign_out_path_for(resource) #ログアウト後の遷移先を設定
    root_path
  end
  
end
