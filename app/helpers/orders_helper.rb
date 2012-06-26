module OrdersHelper

	def created order
   		order.created_at if order.created_at.to_date == Date.today
	end

end
