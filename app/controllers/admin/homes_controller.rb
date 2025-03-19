class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top #管理者用トップページを表示
  end
end
