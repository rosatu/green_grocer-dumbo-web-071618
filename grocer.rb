require 'pry'
def consolidate_cart(cart)
  consolidated_groceries = {}
  cart.each do |grocery_item_hash|
      grocery_item_hash.each do |item, price_hash|
        if consolidated_groceries[item]== nil
           consolidated_groceries[item]={:price => price_hash[:price], :clearance => price_hash[:clearance], :count => 1}
        else
          consolidated_groceries[item][:count]+=1
        end
      end
  end
  return consolidated_groceries
end

def how_many_coupons?(grocery_item,coupons)
  counter = 0
  coupons.each do |coupon|
    if coupon[:item] == grocery_item
      counter += 1
    end
  end
  return counter
end

def apply_coupons(cart, coupons)
	 items_w_coupons = cart.clone
	 cart.each do |grocery_item, item_hash|
  	 coupons.each do |coupon|
  	   binding.pry
  		if coupon[:item] == grocery_item
    	items_w_coupons["#{grocery_item} W/COUPON"] = {:price => coupon[:cost], :clearance => item_hash[:clearance], :count =>  how_many_coupons?(grocery_item,coupons)}
    	   if item_hash[:count].to_i % how_many_coupons?(grocery_item, coupons) != 0
    	     binding.pry
    	    items_w_coupons[grocery_item][:count] = items_w_coupons[grocery_item][:count] % how_many_coupons?(grocery_item,coupons)
         end
       end
      end
    end    
  return items_w_coupons
end


def apply_clearance(cart)
  modified_cart = {}
  cart.each do |grocery_item, item_info_hash|
    modified_cart[grocery_item] = {}
    if item_info_hash[:clearance] == true
       modified_cart[grocery_item][:price] = item_info_hash[:price] * 4 / 5
    else   
       modified_cart[grocery_item][:price] = item_info_hash[:price]
    end
    modified_cart[grocery_item][:clearance] = item_info_hash[:clearance]
    modified_cart[grocery_item][:count] = item_info_hash[:count]
    end
    modified_cart
end 


def checkout(cart, coupons)
  consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |itemname, data|
  total += ( data[:price] * data[:count] )
end 
  if total > 100
  cart = cart * 0.9
end
end

    
    
  

