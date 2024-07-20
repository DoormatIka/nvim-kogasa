# Kogasa's Neovim
Yomo's minimalist configuration for Neovim.

- `n`: Normal Mode
- `i`: Insert Mode
- `v`: Visual Mode
- `<leader>`: ";"

### Installation:
1. Clone this to `C:\Users\[username]\AppData\Local\nvim`
2. Do `:PackerSync` after you get into Neovim.
3. Done!

### Special Keybinds
- `Ctrl + Space [i]`: Refresh the selection.
- `Ctrl + (Up | Down) [n, i, v]`: Scroll through the secondary floating window. Typically showing documentation.
- `<leader> + ff [n]`: Find files.
- `<leader> + fg [n]`: Grep.
- `<leader> + fh [n]`: Search Help.
- `<leader> + c [n]`: List of commands.
- `<leader> + fw [n]`: Show all workspaces.
- `Ctrl + w, z [n]`: Equalize window (when the windows are cramped and window folding kicks in)
- `Ctrl + w, p [n]`: Maximize window
- `K [n]`: Show documentation.
- `Ctrl + d [i]`: In projects telescope, delete the project marker.

## Personal Useful Key Combos
- `A` - A shorter distance than `$`. Jumps to the end of the line in insert mode.
- `yy` - Yanks current line. You don't have to press `V + y` anymore.
- `[F | f][letter]` - Jumps [back | forward] to the nearest [letter].
- `n | N` - next or previous. Great for cycling through search items.
- `*` - Hover over a word and press this. It'll search the word for you.

Operators:
- Starter operators are: c (change), d (delete), v (visual or highlight), y (yank or copy)
- Essential operators include: W (contigious text), w (word), a (around), i (inside).
E.g: 
- `d[a | i][w | s | p]` deletes a word, sentence or paragraph
- `d[a | i][( | < | {]` deletes parenthesis, angle brackets, and curly braces.
- v[a | i][w | s | p] selects a word, sentence, paragraph

Repeaters:
- You can also add a number for every keybind you do, `d3b`, `v10b`, etc.
E.g:
- `d3b` - Deletes the previous (b) 3 words.
- `d3w` - Deletes the next (w) 3 words.

Leaving a key/keys after it was pressed in normal mode shows you the keybinds you could do.

### Others
To utilize the Workspaces feature, add a `.nvimproj` file to 
your folder root, and go inside the `.nvimproj` to add it.

Or just use :AddProject while you're in the folder.
