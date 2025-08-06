puts "Welcome to the Super Trunfo Game."

# Function responsible for creating a new card
def create_card
  # Asking the user for the card information
  puts "Type the state: "
  state = gets.chomp

  puts "Type the city: "
  city = gets.chomp

  puts "Type the GDP: "
  gdp = gets.chomp.to_f   # Convert input to float (decimal number)

  puts "Type the population: "
  population = gets.chomp.to_i  # Convert input to integer

  puts "Type the city's area (km²): "
  area = gets.chomp.to_f

  # Calculations based on the provided data
  gdp_per_capita = gdp / population
  density = (population / area).round   # Round to the nearest integer
  density = 1 if density == 0 && population > 0 # Ensure minimum density of 1

  # Store the card's data in a hash
  card = {
    state: state,
    city: city,
    population: population,
    gdp: gdp,
    area: area,
    gdp_per_capita: gdp_per_capita,
    density: density
  }

  return card # Return the card (hash)
end

# Function responsible for displaying a card's details
def show_card(card)
  puts "=============================="
  puts "State: #{card[:state]}"
  puts "City: #{card[:city]}"
  puts "Population: #{card[:population]}"
  puts "GDP: R$ #{card[:gdp]}"
  puts "Area: #{card[:area]} km²"
  puts "GDP per capita: R$ #{card[:gdp_per_capita].round(2)}"
  puts "Population density: #{card[:density]} inhabitants/km²"
  puts "=============================="
end

# Main loop of the game (menu)
begin
  print "******************************************\n"
  puts "Choose an option to start:"
  puts "1. Start"
  puts "2. Rules"
  puts "3. Exit"
  print "******************************************\n"
  initial_choice = gets.chomp.to_i

  if initial_choice == 1 
    # Player creates two cards
    card1 = create_card
    puts "Now create another card."
    card2 = create_card

    # Display both cards
    puts "===== Card 1 ====="
    show_card(card1)

    puts "===== Card 2 ====="
    show_card(card2)

  elsif initial_choice == 2
    # Rules explanation
    puts "Game Rules: Your goal is to defeat your opponent with stronger cards!"
  elsif initial_choice == 3
    # Exit message
    puts "Exiting the game. See you next time!"
  else
    # Invalid option handling
    puts "Invalid option. Please try again."
  end
end while initial_choice != 3