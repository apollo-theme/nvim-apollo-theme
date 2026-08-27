# Apollo for Neovim

Apollo is a high-contrast dark colorscheme derived from the canonical SonicTerm Apollo palette. It provides broad core UI, syntax, diff, diagnostic, LSP, and Neovim 0.12 Tree-sitter highlighting plus exact terminal ANSI colors. It does not depend on or style third-party plugins.

Repository: https://github.com/apollo-theme/nvim-apollo-theme

## Install

### lazy.nvim

Add this plugin spec and run `:Lazy sync`:

```lua
{
  'https://github.com/apollo-theme/nvim-apollo-theme',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('apollo')
  end,
}
```

### Manual package

```sh
git clone --depth 1 https://github.com/apollo-theme/nvim-apollo-theme \
  ~/.local/share/nvim/site/pack/apollo/start/nvim-apollo-theme
```

## Activate

If your plugin manager does not activate the theme, add this to `init.lua`:

```lua
vim.cmd.colorscheme('apollo')
```

## Uninstall

For lazy.nvim, remove the plugin spec and run `:Lazy clean`. For the manual package:

```sh
rm -rf ~/.local/share/nvim/site/pack/apollo/start/nvim-apollo-theme
```

Then remove the `colorscheme` call from your configuration.

## Development

`palette/apollo.json` is an exact palette snapshot. Regenerate the Lua files and run every check with:

```sh
python3 scripts/generate.py
python3 scripts/check.py
```

## License

MIT
