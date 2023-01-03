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

function DisplayBoardDashedRow(board, row) 
    local board_size = #board
    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            if i==row
            then
                io.write(curr and curr.." + " or "_ + ")    
            else
                io.write(curr and curr.."   " or "_   ")
            end
        end
        io.write(board[i][board_size] or "_")

        io.write("\n\n")
    end
end

function DisplayBoardDashedColumn(board, col)
    local board_size = #board
    if col > board_size or col < 1
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
            io.write("\n\t"..string.rep("    ",col-1).."+\n")
        end
    end
end

function DisplayBoardDashedDiagonal1(board)
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
        
        if i>=board_size
        then
            io.write("\n\n")
        else 
            io.write("\n\t  "..string.rep("    ",i-1).."+\n")
        end
    end
end

function DisplayBoardDashedDiagonal2(board)
    --
end

function HandleDisplayCode(board, row, col, code)
    if code == 1
    then
        DisplayBoardDashedRow(row)
    elseif code == 2
    then
        DisplayBoardDashedColumn(col)
    elseif code == 3
    then
        DisplayBoardDashedDiagonal1()
    elseif code == 4
    then
        DisplayBoardDashedDiagonal2()
    end
end