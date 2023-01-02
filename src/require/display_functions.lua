function DisplayBoard(board)
    local board_size = #board
    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or "_   ")
        end
        io.write(board[i][board_size] or "_")
        
        io.write("\n\n")
    end
end

function DisplayBoardDashedLine(board, line) 
    local board_size = #board
    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            if i==line
            then
                io.write(curr and curr.."---" or "_---")    
            else
                io.write(curr and curr.."   " or "_   ")
            end
        end
        io.write(board[i][board_size] or "_")

        io.write("\n\n")
    end
end

function DisplayBoardDashedColumn(board, column)
    local board_size = #board
    if column > board_size or column < 1
    then
        DisplayBoard()
        return
    end

    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or "_   ")
        end
        io.write(board[i][board_size] or "_")
        
        if i==board_size
        then
            io.write("\n\n")
        else 
            io.write("\n\t"..string.rep("    ",column-1).."|\n")
        end
    end
end