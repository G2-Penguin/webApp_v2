class ProductController < ApplicationController
  require 'active_support'
  before_action :forget_selected_item, {only: [:all_index, :discounts_index]}
  
  
  def all_index
    user = User.find_by(id: session[:user_id])
    @product = Product.where(product_store: user.store_id).group(:id,:product_name,:price,:amount).order(id: "ASC")
    @data = Product.new()
  end
  
  def discounts_index
    user = User.find_by(id: session[:user_id])
    @product = Product.where(product_store: user.store_id).where.not(discount_rate: nil).group(:product_name,:price).order(id: "ASC")
    @data = Product.new()
  end
  
  def new
  end
    
  def create
    catego = Category.find_by(category_id: params[:category])
    user = User.find_by(id: session[:user_id])
    
    #for i in 1..num.to_i do
    @product = Product.new(product_name: params[:product_name], price: params[:price], amount: params[:amount], category: catego.category_name, product_store: user.store_id, count: params[:num])
      
    if params[:image]
      image = params[:image].read
    end 
    if image
      @product.product_img = image
    end
      
    #if i != num.to_i 
    if  @product.save
    #elsif @product.save
      redirect_to("/product/all_index")
    else
      @error_message = "入力内容が正しくありません"
      render("product/new")
    end 
    #end
  end 
  
  def edit 
    if session[:selected_item] 
      if params[:selected_item]
        @selected = Product.find_by(id: params[:selected_item])
        session[:selected_item] = @selected.id
      else 
        @selected = Product.find_by(id: session[:selected_item])
      end
    else 
      @selected = Product.find_by(id: params[:selected_item])
      session[:selected_item] = @selected.id
    end
    @count = @selected.count
    @name = @selected.product_name
    @discount_rate = @selected.discount_rate
    @id = params[:selected_item]
    @category = Category.find_by(category_name: @selected.category)
    @cateId = @category.category_id
    #@product = Product.find_by(product_id: params[:product_id])
    
  end 
  
  def update
    catego = Category.find_by(category_id: params[:category])
    @p = Product.find_by(id: params[:selected_item])
    #@products = Product.where(product_name: @p.product_name, price: @p.price)
    if params[:count] == 0
      p.destroy
    else
      if @p.update(product_name: params[:product_name], discount_rate: params[:dis], count: params[:count], category: catego.category_name)
         redirect_to("/product/all_index")
      else
        @name = @p.product_name
        @discount_rate = @p.discount_rate
        @count = @p.count
        @id = @p.id
        render("product/edit")
      end
    end
   
  end 
  
  def destroy
    @p = Product.find_by(id: params[:selected_item])
    @products = Product.where(product_name: @p.product_name, price: @p.price)
    @products.destroy_all
    redirect_to("/product/all_index")
  end 
  
  def search
    if params[:search_name] 
      @product = Product.where("product_name LIKE ?", "%#{params[:search_name]}%").group(:id,:product_name,:price).order(id: "ASC")
    else
      @product = Product.where("category LIKE ?", "%#{params[:category_name]}%").group(:id,:product_name,:price).order(id: "ASC")
    end
    render("product/all_index")
  end 
end
