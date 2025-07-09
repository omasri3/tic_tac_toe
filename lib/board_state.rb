require_relative 'circle'
require_relative 'cross'
require 'pry'

class Board

  attr_accessor :board_state

  def initialize ()
    @board_state = <<-Board
_ | _ | _
_ | _ | _
_ | _ | _
    Board
  end

  def updateBoard(pos, crossOrCircle)
    if pos == "TL"
      @board_state[0] = crossOrCircle
    elsif pos == "TM"
      @board_state[4] = crossOrCircle
    elsif pos == "TR"
      @board_state[8] = crossOrCircle
    elsif pos == "ML"
      @board_state[10] = crossOrCircle
    elsif pos == "MM"
      @board_state[14] = crossOrCircle
    elsif pos == "MR"
      @board_state[18] = crossOrCircle
    elsif pos == "BL"
      @board_state[20] = crossOrCircle
    elsif pos == "BM"
      @board_state[24] = crossOrCircle
    elsif pos == "BR"
      @board_state[28] = crossOrCircle
    else
      puts "Invalid board move, try again. Board Moves are like 'TM' for top middle or 'BR' for bottom right"
    end
  end

  def calculateWin(player)
    
    playerWins = false

    if player == 1
      topRowWin = [@board_state[0], @board_state[4], @board_state[8]].all? {|piece| piece == 'X'}
      middleRowWin = [@board_state[10], @board_state[14], @board_state[18]].all? {|piece| piece == 'X'}
      bottomRowWin = [@board_state[20], @board_state[24], @board_state[28]].all? {|piece| piece == 'X'}
      leftColWin = [@board_state[0], @board_state[10], @board_state[20]].all? {|piece| piece == 'X'}
      middleColWin = [@board_state[4], @board_state[14], @board_state[24]].all? {|piece| piece == 'X'}
      rightColWin = [@board_state[8], @board_state[18], @board_state[28]].all? {|piece| piece == 'X'}
      downDiagWin = [@board_state[0], @board_state[14], @board_state[28]].all? {|piece| piece == 'X'}
      upDiagWin = [@board_state[20], @board_state[14], @board_state[8]].all? {|piece| piece == 'X'}
    else
      topRowWin = [@board_state[0], @board_state[4], @board_state[8]].all? {|piece| piece == 'O'}
      middleRowWin = [@board_state[10], @board_state[14], @board_state[18]].all? {|piece| piece == 'O'}
      bottomRowWin = [@board_state[20], @board_state[24], @board_state[28]].all? {|piece| piece == 'O'}
      leftColWin = [@board_state[0], @board_state[10], @board_state[20]].all? {|piece| piece == 'O'}
      middleColWin = [@board_state[4], @board_state[14], @board_state[24]].all? {|piece| piece == 'O'}
      rightColWin = [@board_state[8], @board_state[18], @board_state[28]].all? {|piece| piece == 'O'}
      downDiagWin = [@board_state[0], @board_state[14], @board_state[28]].all? {|piece| piece == 'O'}
      upDiagWin = [@board_state[20], @board_state[14], @board_state[8]].all? {|piece| piece == 'O'}
    end
    if topRowWin || middleRowWin || bottomRowWin || leftColWin || middleColWin || rightColWin || downDiagWin || upDiagWin
      playerWins = true
    end
    if playerWins
      "Player ##{player} is the Winner!"
    else
      "No winner yet"
    end
  end
end