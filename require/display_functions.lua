function DisplayHelp()
local str = [[
USAGE: lua tic-tac-toing.out [-p1=<name> | --player1=<name>]
                             [-p2=<name> | --player2=<name>]
                             [-cp1=<character> | --charplayer1=<character>]
                             [-cp2=<character> | --charplayer2=<character>]
                             [-c=<character> | --displaychar=<character>]
                             [-d=<character> | --dashchar=<character>]
                             [-s=<number> | --sizeofboard=<number>]
                             [-h | --help]

COMMAND LINE OPTIONS:
       -p1, --player1
Set the player 1 name in the game. DEFAULT: player1

       -p1, --player1
Set the player 2 name in the game. DEFAULT: player2

       -cp1, --charplayer1
Set the player 1's playing character. DEFAULT: X

       -cp2, --charplayer2
Set the player 2's playing character. DEFAULT: O

       -c, --displaychar
Set character used to represent empty positions in the board. DEFAULT: #

       -c, --dashchar
Set character used to represent the line that is formed in the board when someone wins. DEFAULT: +

       -s, --sizeofboard
Set the size of the tic tac toe board. For instance, if 3 then the board will be 3x3 sized. DEFAULT: 3
    ]]

    print(str)
end

function DisplayCoolLogo()
    local str = [[
     ⢀⣀⣀⣀⣀⣀       ⣀⣀⣀⣀⣀⡀        ⣀⣀⣀⣀⣀⡀
     ⠛⠛⢻⣿⠛⠛⣃⡀ ⣀⣀⡀⠘⠛⠛⣿⡟⠛⢛⣀⣀  ⣀⣀⡀⠘⠛⠛⣿⡟⠛⠛⣀⣀⡀⢀⣀ ⢀⣀⣀ ⢀⣀⡀
       ⢸⣿  ⢛⡁⢸⣿⠛⠃   ⣿⡇ ⢨⣭⣿⡇⢸⣿⠛⠃   ⣿⡇ ⢸⡏⢹⡇⠘⣋ ⣿⠛⣿ ⣿⠛⣿
       ⢸⣿  ⣿⡇⢸⣿⣶⡆   ⣿⡇ ⢸⣧⣼⣇⢸⣿⣶⡆   ⣿⡇ ⢸⣧⣼⠇⢸⣿ ⣿ ⣿ ⠿⠶⣿
                                                ⠲⠶⠟
    ]]
    print(str)
end

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
