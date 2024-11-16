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

get("/square/results") do
  @input_num = params.fetch("number").to_i
  @num_square = (@input_num ** 2).to_f

  erb(:square_results)

end

get("/square_root/new") do

  erb(:square_root_new)
end


get("/square_root/results") do
  @number = params.fetch("user_number").to_i
  @square_root = Math.sqrt(@number).to_f

  erb(:square_root_results)
end


get("/payment/new") do

  erb(:payment_new)
end

get ("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f.to_fs(:percentage, {:precision => 4})
  @user_years = params.fetch("user_years").to_i
  @user_pv = params.fetch("user_pv").to_f.to_fs(:currency)
  r = params.fetch("user_apr").to_f / 100 / 12
  n = params.fetch("user_years").to_i * 12
  result = (r * @user_years) / (1 - (1 + r) ** -n)
  @rounded_result = result.to_fs(:currency, {:precision => 2})

  erb(:payment_results)
end


get("/random/new") do

  erb(:random_new)
end

get()
