class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def show
    @categories = Category.count
    @products = Product.count
  end
end
