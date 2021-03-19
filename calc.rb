require 'sinatra'
require 'sinatra/reloader' if development?

get '/calc/bmi' do
  erb :calc, layout: :my_layout
end

post '/calc/bmi/result' do
  h = params[:height].to_f / 100
  w = params[:weight].to_f
  bmi = (w / (h*h)).floor(2)

  if bmi < 24 && bmi >= 18.5
    word = "健康體重，你是健康寶寶喔！"
  elsif bmi < 18.5
    word = "體重過輕，哎多吃點吧！"
  else
    word = "體重過重，還吃？！動起來動起來！"
  end

  erb :result, locals: {result: bmi, word: word}
end

