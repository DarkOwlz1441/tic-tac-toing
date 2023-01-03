function CheckRow(board, row)
    for i=1, #board-1
    do
        local curr = board[row][i]
        if curr==nil or curr ~= board[row][i+1]
        then
            return nil
        end
    end
    return board[row][1]
end

function CheckColumn(board, col)
    for i=1, #board-1
    do
        local curr = board[i][col]
        if curr==nil or curr ~= board[i][col]
        then
            return nil
        end
    end
    return board[1][col]
end

function CheckDiagonal1(board)
    for i=1, #board-1
    do
        local curr = board[i][i]
        if curr == nil or curr ~= board[i+1][i+1]
        then
            return nil
        end
    end
    return board[1][1]
end

function CheckDiagonal2(board)
    local board_size = #board
    local j1, j2 = 1, 5
        for i=1, board_size-1
        do
            local curr = board[j1][j2]
            if curr==nil or curr ~= board[j1+1][j2-1]
            then
                return nil
            end
            j1, j2 = j1+1, j2-1
        end
        return board[1][board_size]
end

function CheckDiagonals(board, row, col)
    local winner
    if row == col
    then
        winner = CheckDiagonal1(board)
        if winner
        then
            return winner, 3
        end
    end

    if row+col == #board+1
    then
        winner = CheckDiagonal2(board)
        if winner
        then
            return winner, 4
        end
    end

    return nil
end

function CheckWinner(board, row, col)
    local winner
    winner = CheckRow(board, row)
    if winner
    then
        return winner, 1
    end

    winner = CheckColumn(board, col)
    if winner
    then
        return winner, 2
    end

    local c
    winner, c = CheckDiagonals(board, row, col)
    if winner
    then
        return winner, c
    end

    return nil
end