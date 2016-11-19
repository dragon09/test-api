class Account_Register < ApplicationController

@new_product = ""

get '/' do
    session[:name]
    erb :add_to_my_kit
end


post '/' do
  # binding.pry

  puts params
  puts '-----------------------------'
  @new_product = Product.create({
    category: params[:category],
    image: params[:image],
    product: params[:product],
    brand: params[:brand],
    name: params[:name],
    description: params[:description],
    store: params[:store],
    purchasedate: params[:purchasedate],
    expirationdate: params[:expirationdate],
    price: params[:price],
    weblink: params[:weblink],
  });

    @new_product.save

    redirect '/addtokit' do
      erb :add_to_my_kit
    end

  end



end
