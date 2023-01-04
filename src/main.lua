require("require.board_check_functions")
require("require.display_functions")
require("require.utils")

local function initBoard(size, init_val)
    Board = {}

    for i=1, size
    do
        Board[i] = {}
        if init_val ~= nil
        then
            for j=1, size
            do
                Board[i][j] = init_val
            end
        end
    end    
end

local function configure()

    Players = {"player1", "player2"}
    Moves = {"X", "O"}
    Display_chars = {"#", "+"}
    Board = {}
    Board_size = 3


    for i=1, #arg
    do
        local a = arg[i]

        if a[1] ~= "-"
        then
            print("invalid option "..a..". Enter --help or -h to show help")
        end
        
        if a == "-h" or a == "--help"
        then
            DisplayHelp()
            return nil
        else
            local a1, a2 = StrSplit(a, "=")

            if not a2
            then
                print("usage: "..a1.."=something")
                return nil
            end

            if a1 == "-p1" or a1 == "--player1"
            then
                Players[1] = a2
            elseif  a1 == "-p2" or a1 == "--player2"
            then
                Players[2] = a2                
            elseif a1 == '-cp1' or a1 == "--charplayer1"
            then
                if #a2 == 1
                then
                    Moves[1] = a2
                else
                    print("player move should be a single character. ex: "..a1.."=X")
                    return nil
                end
            elseif a1 == '-cp2' or a1 == "--charplayer2"
            then
                if #a2 == 1
                then
                    Moves[2] = a2
                else
                    print("player move should be a single character. ex: "..a1.."=O")
                    return nil
                end
            elseif a1 == "-c" or a1 == "--displaychar"
            then
                if #a2 == 1
                then
                    Display_chars[1] = a2
                else
                    print("display character should be a single character. ex: "..a1.."=#")
                    return nil
                end
            elseif a1 == "d" or a1 == "--dashchar"
            then
                if #a2 == 1
                then
                    Display_chars[2] = a2
                else
                    print("winning dash character should be a single character. ex: "..a1.."=+")
                    return nil
                end
            elseif a1 == "-s" or a1 == "--sizeofboard"
            then
                if IsNumericString(a2) then
                    Board_size = tonumber(a2)
                else
                    print("Board size should be a number. ex: "..a1.."=3")
                    return nil
                end
            else
                print("invalid option "..a..". enter --help or -h to show help")
                return nil
            end
        end
    end

    return true
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

if not configure()
then
    return
end

DisplayCoolLogo()
print("                   press ENTER to start")
print("                      (EOF to quit)")
while io.read()
do
    initBoard(Board_size)
    game()
    print("                       play again?")
    print("                   press ENTER to start")
    print("                      (EOF to quit)")
end