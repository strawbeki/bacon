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

  def update
      @order = Order.find(params[:id])
      @order.filling = params[:filling].join(", ")
      if @order.update_attributes(params[:order])
      redirect_to orders_path
      else
      render 'edit'
      end
  end

  def index
  	@orders = Order.all
  end

  def destroy
    Order.find(params[:id]).destroy
    
    redirect_to orders_path
  end

def create

    @order = Order.new(params[:order])
    @order.filling = params[:filling].join(", ")


    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end


end