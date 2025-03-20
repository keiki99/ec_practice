class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show #マイページを表示
  end

  def edit #マイページ編集画面を表示
  end

  def unsubscribe #退会確認画面を表示
  end
end
