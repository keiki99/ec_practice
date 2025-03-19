class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show #マイページを表示
  end
end
