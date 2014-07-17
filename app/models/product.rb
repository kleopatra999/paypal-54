class Product < ActiveRecord::Base
 
 def paypal_url(return_url)
    values = {
    :business => 'rrv461@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id
    }
    
    values.merge!({
    "amount_1" => price,
    "item_name_1" => name,
    "item_number_1" => id,
    "quantity_1" => '2'
    })
    
    # This is a paypal sandbox url and should be changed for production.
    # Better define this url in the application configuration setting on environment
    # basis.
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

  end
 
 
  
end
