class OrdersController < ApplicationController
  
  def show
  @orders = Order.where('start BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
  #@order = Order.find(params[:id])

  end

  def destroy_all
  Order.all.each do |order|
    order.destroy
  end

  redirect_to root_url, :notice => "all orders destroyed!"

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
      redirect_to orders_path, :notice => "order updated!"
      else
      render 'edit'
      end
  end

  def index
  	@orders = Order.all

  end

  def destroy
    Order.find(params[:id]).destroy
    
    redirect_to orders_path, :notice => "order deleted!"
  end

def create

    @order = Order.new(params[:order])
    @order.filling = params[:filling].join(", ")

 
    if @order.save
      redirect_to orders_path, :notice => "order created!"
    else
      render 'new'
    end
  end


end