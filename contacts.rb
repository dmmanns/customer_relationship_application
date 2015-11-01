#created class called Contact => classes must start with a capital.
class Contact
  attr_reader :id 
  attr_accessor :first_name, :last_name, :email, :notes

  @@contacts = [] #class variable  
  @@id = 1

#Used initialize method
def initialize(first_name, last_name, options = {})
  @id = @@id
  @first_name = first_name
  @last_name = last_name
  if options[:email]
    @email = options[:email] 
  end

  if options[:notes]
    @notes = options[:notes]
  end
  
  @@id += 1
end 

#create a new contact
def self.create(first_name, last_name, options = {})
	@@contacts << Contact.new(first_name, last_name, options)
end

#find a contact for changing/modifcations  
def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact 
    end
  end  
end

# # This is a more advanced way of updating 
# def update(field, new_value)
# 	self.send("#{field}=", new_value)
# end

def self.all
    @@contacts
end 

def full_name
	"#{first_name} #{last_name}"
end

end 
