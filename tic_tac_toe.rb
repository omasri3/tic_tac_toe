require_relative 'lib/circle'
require_relative 'lib/cross'
require_relative 'lib/board_state'

circle = Circle.new()
cross = Cross.new()
currentGameBoard = Board.new()

puts currentGameBoard.board_state
puts 'Welcome to a game of tic-tac-toe! To start, player one must choose a location for their first
piece. To select a location, type a two letter string, with the first letter signifying the row and
the second letter signifying the column. "T" stands for top row, "M" stands for middle row, "B"
stands for bottom row, "L" stands for left column, "R" for right column, and "M" for middle column.
So for example, top left would be "TL" and middle of the board will be "MM"'

gameOngoing = true
playerCounter = 1

while gameOngoing do
  puts "Player # #{playerCounter.to_s}'s move"

  move = gets.chomp.upcase()

  if playerCounter == 1
    currentGameBoard.updateBoard(move, cross.cross)
  else
    currentGameBoard.updateBoard(move, circle.circle)
  end

  puts currentGameBoard.board_state

  winner = currentGameBoard.calculateWin(playerCounter)

  if winner[0] == 'P'
  gameOngoing = false
  puts winner
  end

  if playerCounter == 1
    playerCounter = 2
  else
    playerCounter = 1
  end

end