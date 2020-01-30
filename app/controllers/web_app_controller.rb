class WebAppController < ApplicationController
    
    def index
        @products = Product.where(product_store: session[:store_id])
    end
    
    def search_category
        check_list = []
        
        begin
            params[:check_list].each do |key,val|
                check_list.push(val)
            end
        
            if check_list.include?("全て")
                @products = Product.where(product_store: session[:store_id])
            else
                @products = Product.where(product_store: session[:store_id], category: check_list)
            end
            
        rescue
            @products = Product.where(product_store: session[:store_id])
        end
        #render("change_content.js.erb")
        render("web_app/index")
    end
    
    def search_category_dis
        check_list = []
        
        begin
            params[:check_list].each do |key,val|
                check_list.push(val)
            end
        
            if check_list.include?("全て")
                @products = Product.where(product_store: session[:store_id]).where.not(discount_rate: nil)
            else
                @products = Product.where(product_store: session[:store_id], category: check_list).where.not(discount_rate: nil)
            end
            
        rescue
            @products = Product.where(product_store: session[:store_id]).where.not(discount_rate: nil)
        end
        #render("change_content.js.erb")
        render("web_app/discount_index")
    end
    
    def store_list
    end
    
    def set_store
        session[:store_id] = params[:store_id]
        redirect_to("/web_app/index")
    end
    
    def store_info
        @store = Store.find_by(store_id: session[:store_id])
    end
    
    def discount_index
        @products = Product.where(product_store: session[:store_id]).where.not(discount_rate: nil)
    end

end
