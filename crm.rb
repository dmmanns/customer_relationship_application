#requires the use of the contacts.rb coding
require_relative 'contacts.rb'

#create class called CRM
class CRM
  def initialize(name)
  	@name = name
  end 

  #creation of method that prints the main menu for end user to review
  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display a contact"
    puts "5. Display contact attributes"
    puts "6. Delete a contact"
    puts "7. Exit"
  end

  #creation of method that allows the end user to select the option they wish to perform
  #if 7 is selected, the end user is exited from the exited from the main menu 
  def main_menu
  	while true
  		print_main_menu

  		print "Choose an option:"
  		user_input = gets.chomp.to_i

  		break if user_input == 7
  		
      choose_option(user_input)
  	end
  end 

  #initiates what change function the CRM will perform based on selection
  def choose_option(input)
  	# input = user_input
    case input
      when 1 then add_contact
      when 2 then modify_contact
      when 3 then display_all_contacts
      when 4 then display_contact
      when 5 then display_contact_attributes
      when 6 then delete_contact
      when 7 then exit 	
      else puts "I'm sorry Dave, but you cant do that."
    end
  end

  #creation of method for adding a contact 
  def add_contact
    print "First name:"
    first_name = gets.chomp

    print "Last Name:"
    last_name = gets.chomp

    print "Email:"
    email = gets.chomp

    print "Notes:"
    notes = gets.chomp

    Contact.create(first_name, last_name, { email: email, notes: notes })
  end 

  #creation of method for modifying a contact
  def modify_contact
    puts "Enter the id of the contact you would like to modify"
    id_to_modify = gets.chomp 

    contact = Contact.find(id_to_modify)
    
    puts "Are you sure? (y/n)"
  	user_input = gets.chomp

    if user_input == "y"
      puts "Enter the id of the contact that you would like to change? 1. First Name, 2. Last Name, 3. Email, 4. Notes"
      user_input = gets.chomp
      puts "What is the new value?"
      new_value = gets.chomp 
      case field  
    	  when 1 
    	    contact.first_name = new_value
    	  when 2
      		contact.last_name = new_value
    	  when 3 
      		contact.email = new_value
    	  when 4
          contact.notes = new_value 
        else 
  	      puts "No changes were made"
      end 
    end
  end

  def display_contact
    puts "What contact ID are you looking for?"
    id = gets.chomp.to_i

    contact = Contact.find(id)
    print_contact(contact)
  end

  def display_all_contacts
    contacts = Contact.all
    contacts.each do |contact|
      print_contact(contact)
    end
  end

  def print_contact(contact)
    puts "(#{contact.id}) #{contact.full_name} - #{contact.email}"
    puts "Notes: #{contact.notes}"
  end

  def delete_contact
    puts "Which contact do you want to delete (id): "
    number = gets.chomp.to_i

    contacts = Contact.all
    contacts.delete_if do |contact|
      contact.id == number
    end
  end 
end 

my_awesome_crm = CRM.new('Bitmaker CRM')
my_awesome_crm.main_menu
