require_relative 'contact'
require 'sinatra'

#Fake data, implementing one contact so id = 1 exists
Contact.create('John', 'Google', 'test@email.com', 'Unemployed')
#Contact.create('Luis', 'Bon', 'imagine@something.com', 'Fire Fighter')
#Contact.create('Monique', 'Camarino', 'email@hotmail.com', 'Waitress')

  get '/' do
    @crm_app_name = "Daniel's CRM"
    @server_time = Time.now
    erb :index
  end

  get '/contacts' do
    erb :contacts
  end

  get '/contacts/new' do
    erb :new_contact
  end

  post '/contacts' do
    Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
    redirect to('/contacts')
  end

  get '/contacts/1' do
    @contact = Contact.find(1)
    erb :show_contact
  end
