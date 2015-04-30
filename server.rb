require 'sinatra'
require 'json'
require_relative 'mensa'

get '/mensa' do
  scraper = MensaScraper.new
  mensa_list = []
  scraper.mensa_list do |m|
    mensa_list << m
  end
  JSON.dump(mensa_list)
end

get '/mensa/:name' do |name|
  scraper = MensaScraper.new
  meal_list = []
  scraper.mensa_menu name do |m|
    meal_list << m
  end
  JSON.dump(meal_list)
end
