require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__)+'/lib/*.rb'].each { |file| require file}

get '/' do
  @tamagotchis = Tamagotchi.all

  erb :index
end

post '/tamagotchi_add' do
  name = params['name']
  @tamagotchi = Tamagotchi.create({:name => name })

  redirect '/'
end

get '/tamagotchi/:id' do
  @tamagotchi = Tamagotchi.find(params['id'])

  erb :tamagotchi
end

post '/tamagotchi_play' do

  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.time_passes
  activity_level = @tamagotchi.set_activity_level(10)
  food_level = @tamagotchi.food_level
  sleep_level = @tamagotchi.sleep_level

  alive = @tamagotchi.is_alive

  @tamagotchi.update ({:activity_level => activity_level, :food_level => food_level, :sleep_level =>sleep_level, :alive => alive})

  redirect back
end

post '/tamagotchi_feed' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.time_passes
  food_level = @tamagotchi.set_food_level(10)
  activity_level = @tamagotchi.activity_level
  sleep_level = @tamagotchi.sleep_level

  alive = @tamagotchi.is_alive

  @tamagotchi.update ({:activity_level => activity_level, :food_level => food_level, :sleep_level =>sleep_level, :alive => alive})

  redirect back
end

post '/tamagotchi_sleep' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  @tamagotchi.time_passes
  sleep_level = @tamagotchi.set_sleep_level(10)
  activity_level = @tamagotchi.activity_level
  food_level = @tamagotchi.food_level

  alive = @tamagotchi.is_alive

  @tamagotchi.update ({:activity_level => activity_level, :food_level => food_level, :sleep_level =>sleep_level, :alive => alive})

  redirect back
end

post '/tamagotchi_murder' do
  @tamagotchi = Tamagotchi.find(params['id'].to_i)
  food_level = @tamagotchi.set_food_level(0)
  sleep_level = @tamagotchi.set_sleep_level(0)
  activity_level = @tamagotchi.set_activity_level(0)
  alive = @tamagotchi.is_alive

  @tamagotchi.update ({:activity_level => activity_level, :food_level => food_level, :sleep_level =>sleep_level, :alive => alive})


  redirect back
end
