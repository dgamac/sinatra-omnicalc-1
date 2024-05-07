require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("number").to_f

  @square = @num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @num = params.fetch("number").to_f

  @square_root = @num**0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f 
 
  @apr_f = @apr / 100.0 / 12.0

  @num = params.fetch("user_years").to_i

  @num_f = @num * 12
  @principal = params.fetch("user_pv").to_i

  @numer =  @apr_f * (@principal)
  @denom = 1 - ((@apr_f + 1) ** (-@num_f))
  @payment = @numer/@denom

  @apr = @apr.to_fs(:percentage, {:precision => 4})
  @principal = @principal.to_fs(:currency)
  @payment = @payment.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_i
  @max = params.fetch("user_max").to_i

  @random = rand(@min.to_f..@max.to_f)

  erb(:random_results)
end
