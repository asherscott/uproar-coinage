class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    row1 = @board[0]
    row2 = @board[1]
    row3 = @board[2]

    # row checks

    @board.each do |row|
      # for each row of board, if all values are the same and not a blank ' ' => return that value
      set = row.uniq

      return set[0] if set.length == 1 && set[0] != " "
    end

    # column checks

    @board.each_with_index do |col, idx|
      column_vals = []

      @board.each do |row|
        column_vals << row[idx]
      end

      set = column_vals.uniq
      return set[0] if set.length == 1 && set[0] != " "
    end

    # diagonal checks

    if row1[0] == "o" && row2[1] == "o" && row3[2] == "o"
      return "o"
    end

    if row1[2] == "o" && row2[1] == "o" && row3[0] == "o"
      return "o"
    end

    if row1[0] == "x" && row2[1] == "x" && row3[2] == "x"
      return "x"
    end

    if row1[2] == "x" && row2[1] == "x" && row3[0] == "x"
      return "x"
    end

    return "draw"
  end
end
