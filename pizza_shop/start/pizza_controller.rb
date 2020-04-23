require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')


# INDEX
get '/pizza-orders' do
    @orders = PizzaOrder.all()
    erb(:index)
end

# NEW
get '/pizza-orders/new' do
    erb(:new)
end

# SHOW
get '/pizza-orders/:id' do
    id = params[:id].to_i
    @order = PizzaOrder.find(id)
    erb(:show)
end

# CREATE
# NEW

# CREATE
post '/pizza-orders' do
    @order = PizzaOrder.new(params)
    @order.save()   
    erb(:create)     
end

# EDIT

get '/pizza-orders/:id/edit' do
    id = params[:id].to_i
    @order = PizzaOrder.find(id)  
    erb(:edit)     
end

# UPDATE - submit amended details

post '/pizza-orders/:id' do
    PizzaOrder.new(params).update
    redirect to '/pizza-orders'
end

# DELETE

get '/pizza-orders/:id/delete' do
    id = params[:id].to_i
    @order = PizzaOrder.find(id)
    @order.delete
    erb(:destroy)
end



