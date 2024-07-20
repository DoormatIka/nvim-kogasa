
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

return require("packer")
	.startup(function (use)
		use "wbthomason/packer.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            requires = { {"nvim-lua/plenary.nvim"} },
            config = function ()
				local actions = require("telescope.actions")
                require("telescope").setup {
                    pickers = {
                        find_files = {
                            theme = "dropdown"
                        },
                        help_tags = {
                            theme = "dropdown"
                        }
                    },
					defaults = {
						path_display = { "smart" },
						mappings = {
							n = {
								["<C-d>"] = actions.delete_buffer
							},
							i = {
								["<C-h>"] = "which_key",
								["<C-d>"] = actions.delete_buffer
							}
						}
					}
                }
            end
        }
		use { "rebelot/kanagawa.nvim",
			config = function ()
				require("kanagawa").setup {
					theme = "wave"
				}
			end
		}
        use {
            "rose-pine/neovim",
            as = "rose-pine",
            config = function ()
                require("rose-pine").setup {
                    variant = "dawn",
                    dark_variant = "main",
                    disable_background = false,
                    highlight_groups = {
                        ColorColumn = { bg = "rose" },
                        CursorLine = { bg = "foam", blend = 10 },
                        StatusLine = { fg = "love", bg = "love", blend = 10 }
                    }
                }
            end
        }
		use {
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
    	    requires = {
    	        "nvim-lua/plenary.nvim",
    	        "nvim-tree/nvim-web-devicons",
    			"MunifTanjim/nui.nvim",
    	    },
        config = function ()
            require("neo-tree").setup({
                popup_border_style = "rounded",
                enable_diagnostics = true,
                enable_git_status = true,
                open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
                window = {
                    position = "left",
                    width = 20,
                    mappings = {
                        ["a"] = {
                            "add",
                            config = {
                                show_path = "relative"
                            }
                        },
                        ["d"] = "delete"
                    }
                },
                filesystem = {
                    use_libuv_file_watcher = false,
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false
                    },
                    window = {
                        mappings = {
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root"
                        }
                    }
                }
            })
        end
	}
	use {
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function ()
			require("bufferline").setup {
				options = {
					mode = "tabs",
					numbers = "ordinal",
					diagnostics = "coc",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and "E "
								or (e == "warning" and "W " or "I" )
							s = s .. n .. sym
						end
						return s
					end
				}
			}
		end
	}
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function ()
            require("lualine").setup {}
        end
    }
	use {
		'norcalli/nvim-colorizer.lua',
	}
	use {
  		"themaxmarchuk/tailwindcss-colors.nvim",
  		module = "tailwindcss-colors",
  		config = function ()
    		require("tailwindcss-colors").setup()
  		end
	}
	use { "dstein64/vim-startuptime" }
    use { "neoclide/coc.nvim", branch = "release" }
    use { "leafOfTree/vim-svelte-plugin" }
	use {
		"NStefan002/screenkey.nvim",
		config = function()
			require("screenkey").setup()
		end,
	}
	use {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
			require 'nvim-treesitter.install'.prefer_git = false
			require 'nvim-treesitter.install'.compilers = { "clang" }
			require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "wgsl", "lua", "vim", "javascript", "typescript" },
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                }
            }
        end,
        run = function ()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end
    }
    use {
      "gelguy/wilder.nvim",
      requires = { "nvim-tree/nvim-web-devicons", opt = true },
      config = function ()
        local wilder = require("wilder")

        wilder.set_option('renderer',
          wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
              highlights = { border = "Normal" },
              empty_message = wilder.popupmenu_empty_message_with_spinner({
                message = "Can't find anything! "
              }),
              border = "double",
              left = { " ", wilder.popupmenu_devicons() },
              right = { " ", wilder.popupmenu_scrollbar() },
              highlighter = {
                wilder.pcre2_highlighter(),
                wilder.lua_fzy_highlighter(),
              }
            })
          )
        )
        wilder.setup({
          modes = { ":", "/", "?" }
        })
      end,
    }
    use {
      "lewis6991/gitsigns.nvim",
      config = function ()
        require("gitsigns").setup()
      end
    }
    use { "ahmedkhalf/project.nvim",
        config = function ()
            require("project_nvim").setup {
                manual_mode = true,
                patterns = { ".nvimproj" }
            }
            require("telescope").load_extension("projects")
        end
    }
    use { "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("alphaconf")
        end
    }
    use { "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
			vim.o.winminwidth = 7
			vim.o.winwidth = 7
            require('windows').setup()
        end
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
