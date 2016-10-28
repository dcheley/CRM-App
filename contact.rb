class Contact
  @@contacts = []
  @@id = 1

attr_reader :id
attr_accessor :first_name, :last_name, :email, :note

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = "N/A")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note = "N/A")
    new_contact = Contact.new(first_name, last_name, email, note) #this calls on initialize method
    @@contacts << new_contact #puts contact list into array as Class variable
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.find do |contact| #returns first element found in block (Array)
    contact.id == id.to_i
    end
  end

  def self.find_first_name(first_name)
   @@contacts.find do |contact|
     contact.first_name == first_name
     end
  end

  def self.find_last_name(last_name)
   @@contacts.find do |contact|
     contact.last_name == last_name
     end
  end

  def self.find_email(email)
   @@contacts.find do |contact|
     contact.email == email
     end
  end

  def self.find_note(note)
   @@contacts.find do |contact|
     contact.note == note
     end
  end
  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    attribute = attribute.to_sym
    case attribute
    when :first_name
      self.first_name = new_value
    when :last_name
      self.last_name = new_value
    when :email
      self.email = new_value
    when :note
      self.note = new_value
    else
      puts "Update failed; Contact doesn't exist"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, filter)
    case attribute
    when "first_name"
      find_first_name(filter)
    when "last_name"
      find_last_name(filter)
    when "email"
      find_email(filter)
    when "note"
      find_note(filter)
    else
      puts "Search failed; Contact doesn't exist"
    end
  end
  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end
end
