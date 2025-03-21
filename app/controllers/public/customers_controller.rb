class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show #マイページを表示
  end

  def edit #マイページ編集画面を表示
  end

  def unsubscribe #退会確認画面を表示
  end

  def withdraw #退会処理（会員ステータスをfalseに更新する）
    customer = Customer.find(current_customer.id)
    customer.update(is_active: false)
    reset_session
    flash[:notice] = '退会処理が完了しました。'
    redirect_to root_path
  end
end
