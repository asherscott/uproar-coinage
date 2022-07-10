class TicTacToe
  def initialize(board)
    @board = board
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
    check_diags
  end

  def check_row array
    # if all values in array are identical and not blank ' ' => winner
    array.uniq.length == 1 && array.first != " "
  end

  def check_diags
    # turns each diagonal into an array and checks array (row)
    back_diag = []
    for_diag = []

    @board.length.times do |idx|
      back_diag << @board[idx][idx]
      for_diag << @board[@board.length - 1 - idx][idx]
    end

    return back_diag.first if check_row(back_diag)
    return for_diag.first if check_row(for_diag)

    no_winners
  end

  def no_winners
    # game is a draw if there are no blank spaces
    @board.each do |row|
      return "unfinished" if row.include?(" ")
    end

    return "draw"
  end
end
