function DisplayBoard(board, foo_char)
    local c = foo_char or "+"

    local board_size = #board
    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or c.."   ")
        end
        io.write(board[i][board_size] or c)
        
        io.write("\n\n")
    end
end

local function displayBoardDashedRow(board, row, c, d) 
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
                io.write(curr and curr.." + " or c.." "..d.." ")    
            else
                io.write(curr and curr.."   " or c.."   ")
            end
        end
        io.write(board[i][board_size] or c)

        io.write("\n\n")
    end
end

local function displayBoardDashedColumn(board, col, c, d)
    local board_size = #board
    if col > board_size or col < 1
    then
        DisplayBoard(board, c)
        return
    end


    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or c.."   ")
        end
        io.write(board[i][board_size] or c)
        
        if i==board_size
        then
            io.write("\n\n")
        else 
            io.write("\n\t"..string.rep("    ",col-1)..d.."\n")
        end
    end
end

local function displayBoardDashedDiagonal1(board, c, d)
    local board_size = #board

    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or c.."   ")
        end
        io.write(board[i][board_size] or c)
        
        if i>=board_size
        then
            io.write("\n\n")
        else 
            io.write("\n\t  "..string.rep("    ",i-1)..d.."\n")
        end
    end
end

local function displayBoardDashedDiagonal2(board, c, d)
    local board_size = #board

    io.write("\n")
    for i=1, board_size
    do
        io.write("\t")
        for j=1, board_size-1
        do
            local curr = board[i][j]
            io.write(curr and curr.."   " or c.."   ")
        end
        io.write(board[i][board_size] or c)
        
        if i>=board_size
        then
            io.write("\n\n")
        else 
            io.write("\n\t  "..string.rep("    ",board_size-i-1)..d.."\n")
        end
    end
end

function HandleDisplayCode(board, row, col, code, foo_char, dash_char)
    local c, d = foo_char, dash_char
    if not code
    then
        DisplayBoard(board, c)
    elseif code == 1
    then
        displayBoardDashedRow(board, row, c, d)
    elseif code == 2
    then
        displayBoardDashedColumn(board, col, c, d)
    elseif code == 3
    then
        displayBoardDashedDiagonal1(board, c, d)
    elseif code == 4
    then
        displayBoardDashedDiagonal2(board, c, d)
    end
end