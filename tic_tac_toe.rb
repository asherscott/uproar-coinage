class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    # rows
    @board.each do |row|
      return check_row(row) if check_row(row)
    end

    # columns
    @board.transpose.each do |col|
      return check_row(col) if check_row(col)
    end

    # diagonals
    return check_diags if check_diags

    no_winners
  end

  def check_row array
    # if all values in array are identical and not blank ' ' => winner
    winning_char = array.uniq
    return winning_char.first if winning_char.length == 1 && winning_char.first != " "
  end

  def check_diags
    # turns each diagonal into an array and checks array (row)
    back_diag = []
    for_diag = []

    @board.length.times do |idx|
      back_diag << @board[idx][idx]
      for_diag << @board[@board.length - 1 - idx][idx]
    end

    return check_row(back_diag) if check_row(back_diag)
    return check_row(for_diag) if check_row(for_diag)
  end

  def no_winners
    # game is a draw if there are no blank spaces
    @board.each do |row|
      return "unfinished" if row.include?(" ")
    end

    return "draw"
  end
end
