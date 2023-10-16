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

### Others
To utilize the Workspaces feature, add a `.nvimproj` file to 
your folder root, and go inside the `.nvimproj` to add it.
