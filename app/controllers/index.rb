get '/' do #login form and link to create new user
  user = User.find_by(id: session[:user_id])
  if user
    redirect "/users/#{user.id}"
  else
    erb :index
  end
end


post '/' do #logs user in, redirects to users/:id
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
   redirect '/'
  end
end


get '/users/new' do #gets info to create new user
  erb :"users/new"
end


post '/users/new' do #creates a new user, redirect to user homepage
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors
    erb :'users/new'
  end
end


get '/users/:id' do #shows user profile including list of all owned albums
  @user = User.find_by(id: session[:user_id])
  erb :'users/profile'
end


get '/albums/new' do #creates new album

  erb :'albums/new'
end


post '/albums/new' do #saves new album and redicrets to the album

  redirect "albums/#{@album.id}"
end


get '/albums/:id' do #shows all images in album -- and let's you delete and add images (depending on user)

  erb :'albums/show'
end


get '/albums/:id/image/new' do #create new image in a given album
  erb :'images/new'
end


post '/albums/:id/image/new' do #create new image in a given album

  redirect "albums/#{@album.id}"
end


get '/albums/all' do #shows all albums on site
  @albums = Album.all
  erb :'albums/all'
end


delete "/logout" do
  session.delete(:user_id)
  redirect "/"
end
