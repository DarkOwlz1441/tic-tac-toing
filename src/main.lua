require("require.board_check_functions")
require("require.display_functions")
require("require.utils")

Players = {"player1", "player2"}
Moves = {"X", "F"}
Display_chars = {"+", "+"}

local function initBoard(size, init_val)
    Board_size = size
    Board = {}

    for i=1, Board_size
    do
        Board[i] = {}
        if init_val ~= nil
        then
            for j=1, Board_size
            do
                Board[i][j] = init_val
            end
        end
    end    
end


local function configure()
    
end

local function game()
    local c, d, turn = Display_chars[1], Display_chars[2], 1

    io.write("\027[H\027[2J") -- clears the output
    DisplayBoard(Board, Display_chars[0], Display_chars[1])
    io.write(Players[turn].." move: ")
    local move = io.read()

    while move
    do
        local i,j = StrSplit(move, ",")
        if IsNumericString(i) and IsNumericString(j)
        then
            i,j = tonumber(i), tonumber(j)
        else
            i,j = -1,-1
        end
        
        while not IsInRange(i, 1, Board_size) or not IsInRange(j, 1, Board_size)
        do
            io.write("invalid indexing. Try again: ")
            move = io.read()
            
            if not move
            then
                return
            end
            
            i,j = StrSplit(move, ",")
            if IsNumericString(i) and IsNumericString(j)
            then
                i,j = tonumber(i), tonumber(j)
            else
                i,j = -1,-1
            end
        end 

        Board[i][j] = Moves[turn]
        local winner, code = CheckWinner(Board, i, j)
        io.write("\027[H\027[2J") -- clears the output
        HandleDisplayCode(Board, i, j, code, Display_chars[1], Display_chars[2])

        if winner
        then
            print(Players[turn].." WON!")
            return
        end

        turn = turn==1 and turn+1 or turn-1 -- gives the turn to the other player

        io.write(Players[turn].." move: ")
        move = io.read()
    end
end

initBoard(3)
-- configure()
game()

-- HandleDisplayCode(Board, 3, 2, 2, Display_chars[1], Display_chars[2])