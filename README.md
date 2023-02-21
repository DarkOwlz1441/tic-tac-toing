# tic-tac-toing

A tic-tac-toe command-line game, written in Lua scripting language.

## Note for Windows users

There's an alternate branch to this one with an actually runnable project in Windows environment.

## Running the game

There's a **tic-tac-toe.lua** file in src folder. You can only execute it if the Lua interpreter is installed.

Execute it by running the following command, **while staying in the src directory**:

```bash
lua tic-tac-toing.lua
```

Run it like this for more information about the command-line options:

```bash
lua tic-tac-toing.lua -h
```

## Rules

The same rules from the regular tic-tac-toe game, there's not much to explain.

## Trivia

- I made this project as a way to learn the Lua scripting language.
  - This was the first of some programming challenges two friends of mine organized. The challenge was developing a tic-tac-toe game in 48 hours.
- I made this project in less than 3 days.
- In an earlier version of this project, the -h flag, instead of showing actually helpful information, showed the message "HELP! HEEEEELP! HEEEEEEEEY! IS ANYONE THERE?!? SOMEONE! ANYONE! PLEASE! DO SOMETHING!"
- The name tic-tac-toing is a reference to Ratatoing, an awful mockbuster movie of Pixar's Ratatouille, developed by Video Brinquedo animation studios.
- The "fancy logo" showed when you run this project does not use any existent fonts. I actually drew this logo manually using [a braille art generator website](braille-txt.github.io/).
- Originally, I was intending to develop an AI for another game mode against the computer, but I gave up given the time.
- My 9-years-old sister helped me test the game. She liked to play as the 'Seven'.
- The main version of this project and Windows one have literally 2 lines of difference. It's just that in one I use os.execute("clear") to clear the screen and in the other I use os.execute("cls"), because the operating system facilities to clear the screen in Windows and Unix-like systems have different names. That makes the original project 4 characters = 4 bytes larger than the Windows one. I think I was just too lazy to build a solution that was compatible with both systems.
- I can play 3 instruments.
