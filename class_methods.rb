###################################
######  CLASS METHODS & SELF  #####
###################################

#Currently we have been creating classes expect many object to be created from them to utilize their functionality.

#With the help of the keyword 'self', we will have


###################################
######     LEARNING GOALS     #####
###################################

# Review what we've learned about classes so far:
    #Constructor (initialize)
    #Instance Methods
    #Attributes (stored in instance variables)

# Discover new functionality within classes:
    # Class Methods and
    # self


###################################
######      CLASS_REVIEW      #####
###################################

## INSTANCE VARIABLES
    ##ATTRIBUTES OF THAT OBJECT
        #ex: name, username, password

## INSTANCE METHODS
    ##BEHAVIORS OF THE OBJECT
        #ex: make a post, send a message, like a post

#INITIALIZE METHOD
    #Will run everytime you create a new method
# class User
#     def initialize
#         @name
#     end
#     def add_username(name)
#         @name = name
#     end
# end


# class Order
#   def initialize(subtotal, quantity) # <= instance method
#     @subtotal = subtotal
#     @quantity = quantity
#   end
#
#   def total # <= instance method
#     @subtotal * @quantity
#   end
#
#   def to_money # <= instance method
#     # in the line below, `total` is invoking the instance method above
#     "$" + sprintf("%0.02f", total / 100)
#   end
# end
#
# order = Order.new(1000, 2)
# order.to_money #=> $20.00


###################################
########    CLASS METHODS   #######
########     USING SELF     #######
###################################

#Class methods are called directly by the class and not by an instance of the class.

# class Kitten
#     def self.say_meow
#         return "meow" ##### ALWAYS RETURN SOMETHING!! DON'T PUTS INSIDE A METHOD ####
#     end
# end
#
# puts Kitten.say_meow



###################################
######    LETS TRY IT OUT!    #####
###################################


class Pawn
  attr_reader :position
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  # Cannot call on an instance of Pawn class (ex: pawn_one in line 116 below)
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    pawns = []
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}") ##Making a new object of itself within itself (spawning itself) #New objects of pawns are going into pawns
    end

    pawns
  end
end

#make one pawn
one_pawn = Pawn.new("A2")
print one_pawn

#make a whole row of pawns
    ##Making a row of pawns based on the color - starts on a different side - creates an array of instances of pawns
pawns = Pawn.make_row("black")

#What is being stored in this local variable pawns?
    ##A row of pawns on one of the sides of the board
#print pawns
pawns.each do |pawn|
    puts pawn.position
end

#WHAT IS THIS DOING!?
    ##This is randomly shuffling the array of pawns, picking the first one, and finding out it's position (so picking a random pawn in the row)
puts pawns.shuffle.first.position

#Pawn.new is a class method 

###################################
######   WHERE IS THIS USED?  #####
###################################
#Class methods are for anything that does not deal with an individual instance of a class



#In Gems, like faker
  # https://github.com/stympy/faker/blob/master/lib/faker/hacker.rb

#When we get into databases, our data will be tied to a class. That class will have some premade class methods for us to use:  .find, .last, .where
#Those class methods allow you to find specific objects of that class based on an specified attributes of that class.
