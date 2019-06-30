def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp.strip
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card1 = deal_card
  card2 = deal_card
  card_total = card1 + card2
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  prompt_user
  input = get_user_input
  if input == "h"
    card_total += deal_card
  elsif input == "s"
    card_total
  else
    invalid_command
    hit?(card_total)
  end
  card_total
end

def invalid_command
  puts "Please enter a valid command"
end

#dealer

def display_dealer_total(dealer_total)
  puts "The dealer's cards add up to #{dealer_total}"
end

#dealer has to hit until they hit 17 or more
def dealer_round
  dealer_total = deal_card + deal_card
  until dealer_total >= 17 
    dealer_total += deal_card
  end
  return dealer_total
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

=begin
def runner
  welcome 
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
end_game(card_total)
end
=end 

#it'll stay loop forever asking you to h or s if you type s. need to figure out how to get it to move on if you type s

def runner
  input = nil
  welcome 
  card_total = initial_round
  until card_total > 21 
    card_total = hit?(card_total)
    if input == "s"
      break 
    end
    display_card_total(card_total)
    
  end
  if card_total > 21
    end_game(card_total)
  else
    dealer_total = dealer_round
    display_dealer_total(dealer_total)
    if dealer_total > 21
      puts "Dealer busted, you win!"
    elsif dealer_total > card_total
      puts "Dealer wins"
    else
      puts "Congrats, you beat the dealer!"
    end
  end
end
