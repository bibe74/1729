import random

def word_list():
    with open("5_letter_words.txt", "r") as my_file:
        return my_file.read().splitlines()


def random_word(wordlist):
    index = random.randint(0, len(wordlist)-1)
    return wordlist[index]

def is_real_word(guess, wordlist):
    return guess in wordlist 

def check_guess(guess, word):
    guessed = []
    charlist = list(word)
    for i, char in enumerate(guess):       
        if word[i] == guess[i]:
            guessed.append('X')
            charlist.remove(char)
        elif char in charlist:
            guessed.append('O')
            charlist.remove(char)
        else:
            guessed.append('_')

    return ''.join(guessed)  

def next_guess(wordlist):
    control = True
    while control:
        guess = input("Please enter a guess: ").lower()
        if not is_real_word(guess, wordlist):
            print("That's not a real word!")
        else:
            control = False
    return guess
    

def play():
    wordList = word_list()
    current_word = random_word(wordList)
    #print(current_word)
    for _ in range(0, 6):
        guess = next_guess(wordList)
        result = check_guess(guess, current_word)
        if guess == current_word:
            print(result)
            print("You won!")
            return
        print(result)
    print("You lost!")
    print("The word was:", current_word)

play()
