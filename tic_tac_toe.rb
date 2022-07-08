class TicTacToe
  def initialize(board)
    @board = board
  end

  def is_winner arr
    # takes an array, if all values are the same and not a blank ' ' => return that value
    set = arr.uniq
    return set[0] if set.length == 1 && set[0] != " "
  end

  def winner
    @board.each_with_index do |row, idx|
      # row checks
      return is_winner(row) if is_winner(row)

      # column checks
      # turns column into row
      column_vals = []

      @board.each do |col|
        column_vals << col[idx]
      end

      return is_winner(column_vals) if is_winner(column_vals)
    end

    # diagonal checks
    # turns diagonal into row
    back_vals = []
    for_vals = []

    @board.length.times do |idx|
      back_vals << @board[idx][idx]
      for_vals << @board[@board.length - 1 - idx][idx]
    end

    return is_winner(back_vals) if is_winner(back_vals)
    return is_winner(for_vals) if is_winner(for_vals)


    return "draw"
  end
end
