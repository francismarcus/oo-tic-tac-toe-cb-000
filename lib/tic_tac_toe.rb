class TicTacToe

# when a new instance of TicTacToe is initialized, #the instance of the game must set the starting state of the board, #an array with 9 " "
# empty strings, within an instance variable named `@board`.#In other words, your# initialize method should set a@ board variable equal to a new, empty array that represents the game board.
def initialize(board = nil)

# @ board = board || Array.new(9, " ")
board = Array.new(9, " ")
@board = board
end

# defines a constant with arrays for each win combination
WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
  ]

def display_board

# prints arbitrary arrangements of the board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end



def input_to_index(input)

# convert input to integer and subtract 1.# users count from 1, Ruby from 0
@index = input.to_i - 1
end

# sets Xfor left player by default
def move(index, player = "X")
  @board[index] = player
end

# returns true or false based on whetever the position on the board is occupied
def position_taken? (index)
if @board[index] == " "
return false
else
    return true
end
end

# checks position_taken ? and checks if the attempted move is within the bounds of the board
def valid_move? (index)
index.between?(0, 8) && !position_taken?(index)
end

def turn_count
count = 0

# counts occupied positions
@board.each do |index|
    if index != " "
count += 1
end
end
count
end

def current_player
# returns the correct player, X,for the first and third move et.c.
if turn_count % 2 == 0
return "X"
else
  # O for the second and forth move et.c.
return "O"
end
end


def turn
  puts "Please enter 1-9:"
  userInput = gets.strip
  index = input_to_index(userInput)

  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end



def won?
    WIN_COMBINATIONS.each do |win|
        #returns an array of matching indexes for a win
        if win.all? {|y|@board[y] == "X"}
          return win
        elsif win.all? {|y|@board[y] == "O"}
          return win
        end
      end

# returns false for an empty board / a draw
return false
end

def full?
    @board.all? do |position |
    position == "X" || position == "O"
end
end

def draw?
    #true if no winner and board is full
    !won? && full?
    end


def over?
    full?
    end

def winner
if won?
    xyz = won?
    @board[xyz[0]]
end
end

def play
  while !over? && !won? && !draw? # if the game isnt over
    turn # play another turn
  end


if won?
    puts "Congratulations #{winner}!"
elsif draw?
    puts "Cat's Game!"
  end
end

end
