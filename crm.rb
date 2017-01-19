require_relative 'contact'
require 'sinatra'

#Fake data, implementing one contact so id = 1 exists
#Contact.create('John', 'Google', 'test@email.com', 'Unemployed')
#Contact.create('Luis', 'Bon', 'imagine@something.com', 'Fire Fighter')
#Contact.create('Monique', 'Camarino', 'email@hotmail.com', 'Waitress')

  get '/' do
    @crm_app_name = "Daniel's CRM"
    #@server_time = Time.now
    erb :index
  end

  get '/contacts' do
    erb :contacts
  end

  get '/contacts/new' do
    erb :new_contact
  end

  post '/contacts' do
    contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )
    redirect to('/contacts')
  end

  get '/contacts/:id' do
    @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  end

  get '/contacts/:id/edit' do
    @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
  end

  put '/contacts/:id' do
    @contact = Contact.find(params[:id])
    if @contact
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.note = params[:note]
      redirect to ('/contacts')
    else
      raise Sinatra::NotFound
    end
  end

  delete '/contacts/:id' do
    @contact = Contact.find(params[:id].to_i)
    if @contact
      @contact.delete
      redirect to ('/contacts')
    else
      raise Sinatra::NotFound
    end
  end

  after do
    ActiveRecord::Base.connection.close
  end
