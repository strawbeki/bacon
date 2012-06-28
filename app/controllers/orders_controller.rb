class OrdersController < ApplicationController
  

  def show
  @order = Order.find(params[:id])

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
      redirect_to today_path, :notice => "order updated!"
      else
      render 'edit'
      end
  end

  def index
    @orders = Order.all
  end

  def today
    today = Date.today 
    @orders = Order.find(:all, :conditions => ["created_at >= ?", today])
  end




  def destroy
    Order.find(params[:id]).destroy
    
    redirect_to root_url, :notice => "order deleted!"
  end

def create

    @order = Order.new(params[:order])
    @order.filling = params[:filling].join(", ")

 
    if @order.save
      redirect_to today_path, :notice => "order created!"
    else
      render 'new'
    end
  end


end