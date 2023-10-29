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
Keybinds with `+blank` can be chained into other keys.

- `cw[word]` - `+Change +word [word]` 
Replaces the previous word with [word]. Really cool stuff.
- `A` - A shorter distance than `$`. Jumps to the end of the line in insert mode.
- `yy` - Yanks current line. You don't have to press `V + y` anymore.
- `da[]` - `+Delete +around [blank]`. 
da[p] deletes a paragraph, da[s] deletes a sentence, da[b] deletes parenthesis, da[B] deletes curly braces.

Leaving a key/keys after it was pressed in normal mode shows you the keybinds you could do.

### Others
To utilize the Workspaces feature, add a `.nvimproj` file to 
your folder root, and go inside the `.nvimproj` to add it.

Or just use :AddProject while you're in the folder.
