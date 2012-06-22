class OrdersController < ApplicationController
    
  def show
  @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
      @order = Order.find(params[:id])
  end

  def index
  	@orders = Order.all
  end


def create

    @order = Order.new(params[:order])
    @order.filling = params[:filling]

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end


end