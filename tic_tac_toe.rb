class TicTacToe
  def initialize(board)
    @board = board
    @center = @board[(@board.length-1) / 2][(@board.length-1) / 2]
  end

  def winner
    # rows
    @board.each do |row|
      return row.first if check_row(row)
    end

    # columns
    @board.transpose.each do |col|
      return col.first if check_row(col)
    end

    # diagonals
    return @center if check_diags

    no_winners
  end

  def check_row array
    # if all values in array are identical and not blank ' ' => winner
    array.uniq.length == 1 && array.first != " "
  end

  def check_diags
    back_diag = []
    for_diag = []

    @board.length.times do |idx|
      back_diag << @board[idx][idx]
      for_diag << @board[-idx - 1][idx]
    end

    # regardless of winner, board's center value will always be winner
    check_row(back_diag) || check_row(for_diag)
  end

  def no_winners
    # game is a draw if there are no blank spaces
    @board.each do |row|
      return "unfinished" if row.include?(" ")
    end

    return "draw"
  end
end
