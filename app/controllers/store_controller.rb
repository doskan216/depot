class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    @products = Product.all.order(:title)

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @counter = session[:counter]

    #デバック用
    # puts"------------------------"
    # puts session[:counter]
    # puts"------------------------"

    #     session[:counter] = 1
    @cart = current_cart
  end
end
