require 'pry'
def consolidate_cart(cart)
  consolidated_groceries = {}
  cart.each do |grocery_item_hash|
      grocery_item.each do |item, price_hash|
      binding.pry
        if consolidated_groceries[p_c]== nil
          consolidated_groceries[p_c]={price: amt_true[:price], clearance: amt_true[:clearance], count: 1}
        else
          consolidated_groceries[p_c][:count]+=1
        end
      end
  end
  return consolidated_groceries
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
