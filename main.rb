require 'pry-byebug'

  # Encrypts a string using the Caesar cipher algorithm.
  #
  # The Caesar cipher is a substitution cipher where each letter in the plaintext is 'shifted' a certain number of places down the alphabet.
  # For example, with a shift of 1, A would be replaced by B, B would become C, and so on.
  #
  # This function takes two arguments: the string text to be encrypted and the shift number.
  # The shift number can be any positive or negative integer.
  # Positive integers are used for encryption and negative integers are used for decryption.
  #
  # The function returns the encrypted/decrypted string.
def caesar_cipher(string_text, shift_number)
  # Normalize the shift_number: Modulo 26 handles large numbers (>25) and negative numbers
  # if wanna decrypt this code use negative number on the shift_number
  normalized_shift = shift_number % 26
  
  # Initialize the result of string
  result = ''

  # Iterate over each character in the input string
  string_text.each_char do |char|
    
    # Handle Uppercase Letters (A-Z)
    if char.ord.between?('A'.ord, 'Z'.ord)
      base = 'A'.ord
      
      # Calculate relative index of the string that will be encrypted
      index_char_now = char.ord - base

      # Caesar cipher formula: C = (P + k) mod 26
      new_char_index = (index_char_now + normalized_shift) % 26
      
      # Convert the new index back to a character
      result << (new_char_index + base).chr
      
    # Handle Lowercase Letters (a-z)
    elsif char.ord.between?('a'.ord, 'z'.ord)
      base = 'a'.ord
      
      # Calculate relative index of the string that will be encrypted
      index_char_now = char.ord - base
      
      # Caesar cipher formula: C = (P + k) mod 26
      new_char_index = (index_char_now + normalized_shift) % 26
      
      # Convert the new index back to a character
      result << (new_char_index + base).chr
      
    # Handle for Non-Alphabetical Characters like spaces, symbols (!, @, #, etc.), and numbers
    else
      # Append the character as is result
      result << char
    end
  end
  return result
end

# input from terminal
print "Enter a string: "
input_user_string = gets.chomp

print "Enter a number: "
input_user_number = gets.chomp.to_i

# check the condition of the input
# if the input is a string and a number
# print the block code, otherwise print the invalid input
puts '------------------------------------------------------'
unless input_user_string.is_a?(String) && input_user_number.is_a?(Integer)
  encrypt = caesar_cipher(input_user_string, input_user_number)
  puts encrypt

  decrypt = caesar_cipher(encrypt, -input_user_number)
  puts decrypt
else
  puts "Invalid input. Please enter a string and a number."
  exit
end

