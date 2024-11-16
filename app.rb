require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/:square/results") do
  @input_num = params.fetch("number").to_i
  @num_square = (@input_num ** 2).to_f

  erb(:square_results)

end

get("/square_root/new") do

  erb(:square_root_new)
end

get("/:square_root/results") do
  @number = params.fetch("user_number").to_i
  @square_root = Math.sqrt(@number)
end

get("/random/new") do
  erb(:index)
end

get("/payment/new") do
  erb(:index)
end
