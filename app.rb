require 'sinatra'
require 'nmatrix/lapack_plugin'

get '/' do
  @s = (params[:s] || 3).to_i
  
  t = Time.now
  @m = N.random([@s,@s])
  @v = N.random([@s,1])
  @dot = @m.dot(@v)
  @svd = @m.gesvd
  @t = Time.now - t

  erb :index
end
