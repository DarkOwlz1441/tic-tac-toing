require("require.board_check_functions")
require("require.display_functions")
require("require.utils")

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
    Players = {"player1", "player2"}
    Moves = {"X", "F"}
    Display_chars = {"@", "+"}
end

local function game()
    local c, d, turn, n_moves = Display_chars[1], Display_chars[2], 1, 0

    io.write("\027[H\027[2J") -- clears the output
    DisplayBoard(Board, c)
    
    while true
    do
        io.write(Players[turn].." move: ")
        
        ::reading_input::

        local move = io.read()
        
        if not move
        then
            print("end")
            return
        end

        local i,j = StrSplit(move, ",")

        if not IsNumericString(i) or not IsNumericString(j)
        then
            io.write("invalid input. Try again: ")
            goto reading_input
        end

        i,j = tonumber(i), tonumber(j)
        
        if not IsInRange(i, 1, Board_size) or not IsInRange(j, 1, Board_size)
        then
            io.write("invalid indexing. Try again: ")
            goto reading_input
        end 

        if Board[i][j]
        then
            io.write("this position is taken. Try again: ")
            goto reading_input
        end

        Board[i][j] = Moves[turn]
        n_moves = n_moves+1

        -- no need to check for winner if number of moves is not enough for someone to win
        
        local winner, code
        
        if n_moves >= 2*Board_size-1
        then
            winner, code = CheckWinner(Board, i, j)
        end

        io.write("\027[H\027[2J") -- clears the output
        print(winner, code)
        HandleDisplayCode(Board, i, j, code, c, d)
        if winner
        then
            print(Players[turn].." WON!")
            return
        end

        if n_moves == Board_size*Board_size
        then
            print("it's a tie!")
            return
        end

        turn = turn==1 and turn+1 or turn-1 -- gives the turn to the other player
    end
end

initBoard(3)
configure()
game()