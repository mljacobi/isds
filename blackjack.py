import random

card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
play_again = 'yes'
while play_again == 'yes':
  sum = random.choice(card_values)
  turn = "hit"
  while turn == "hit":
    value = random.choice(card_values)
    sum += random.choice(card_values)
    print("You currently have: " + str(sum))
    if sum >= 21:
        break
    turn = input("What do you want to do? ")

    if sum == 21:
        print("you got 21!")
    elif sum > 21:
        print("busted!")
    else:
        print("You stopped at: " + str(sum))

  play_again = input("Want to play again? ")
