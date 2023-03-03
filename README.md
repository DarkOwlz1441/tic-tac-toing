# tic-tac-toing

A tic-tac-toe command-line game, written in Lua scripting language.

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
- The "fancy logo" showed when you run this project does not use any existent fonts. I actually drew this logo manually using [a braille art generator website](https://braille-txt.github.io/).
- Originally, I was intending to develop an AI for another game mode against the computer, but I gave up given the time.
- My 9-years-old sister helped me test the game. She liked to play as the 'Seven'.
- This project had an alternate branch called "Windows", it had literally 2 lines of difference from the main one. It's just that in one I used os.execute("clear") to clear the screen and in the other I used os.execute("cls"), because the operating system facilities to clear the screen in Windows and Unix-like systems have different names. That made the original project 4 characters = 4 bytes larger than the Windows one. I think I was just too lazy to build a solution that was compatible with both systems. After a month I eventually decided to delete Windows branch and make a quick verification to make the main code runnable in both systems.
- I can play 3 instruments.
