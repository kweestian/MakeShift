# Homepage (Root path)
helpers do
  def current_user
    current_user ||= User.find_by_username(session[:user])
  end
end

get '/' do
  erb :index
end

get '/profile' do
  @projects = Project.all
  @current = current_user.projects
  erb :'projects/profile'
end

get '/project' do
  @projects = Project.all
  erb :'projects/project'
end

get'/create' do
  @types = Type.all
  @materials = Material.all
  erb :'projects/create'
end

get '/find' do
	@material = Material.all
  erb :'projects/find'  
end

post '/find' do
  where_clause = params[:array_data].split(/,/)
  @search_projects = Project.where('materials.name' => where_clause).joins(:materials).group('id')
  erb :"/projects/result"
end

get '/result' do
  erb :'/projects/result'
end

get '/login' do
  erb :'projects/login'
end

post '/project' do
  @project = Project.new(name: params[:name], rating: 0, photo: params[:photo])
  if @project.save
    params[:materials][:name].each do |material_id|
      @project.materials << Material.find(material_id)
    end
    params[:steps][:instruction].each do |instructions|
      @project.guides << Guide.new(instruction: instructions)
    end
    params[:types][:name].each do |type_id|
      @project.types << Type.find(type_id)
    end
    @project.users << current_user
    redirect:"/project/#{@project.id}"
  else
    redirect:"/create"
  end 
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.where(username: username, password: password).first
  if user
    session[:user] = user.username
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/project/:id' do
  @projects = Project.find(params[:id])
  erb :'projects/project'
end

get '/create_user' do
  erb :'projects/create_user'
end

post '/create_user' do
  username = params[:username]
  password = params[:password]
  email = params[:email]

  user = User.create(username: username, password: password, email: email)

  redirect '/'
end



