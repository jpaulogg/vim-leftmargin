# leftmargin.vim

Vim plugin that adds left margin to terminal windows, making easier to read and write prose

## Similar plugins
[Goyo](https://github.com/junegunn/goyo.vim/tree/master/)

[vim-venter](https://github.com/JMcKiern/vim-venter)

[mutton-vim](https://github.com/gabenespoli/vim-mutton)

### Main differences

- local to window (you can have windows with left margin and others without it);
- doesn't hide statusline by default (not difficult to achieve);
- doesn't create new windows to simulate margins;
- because of that, doesn't create a right margin;
- left margin has a 32 column width limit (`numberwidth + foldcolumn`)
- leftmargin.vim script has ~70 lines of code, while goyo.vim has ~390.

For more details, take a look at the script. It's very simple!

## Commands and mappings

`:LeftMargin` adds left margin.

`:NoMargin` removes left margin.

`<leader>p` toggles left margin.

## Customization 

The script contains commentaries that helps to hide `statusline` when margin is active. Follow the
suggestions in the comments in the script and it should be easy to make any changes you want.

## Installation

Just copy leftmargin.vim to `plugin` directory in your runtime. For example:

```
mkdir -p ~/.config/nvim/plugin/
cd ~/.config/nvim/plugin/
git clone https://github.com/jpaulogg/vim-leftmargin
```

If you prefer, install using your favorite package manager, or use (Neo)Vim's built-in package
support. Use `pack` branch in that case:

```
# vim-plug
Plug 'jpaulogg/vim-leftmargin', { 'branch' : 'pack' }
:PlugInstall

# built-in package support
mkdir -p ~/.config/nvim/pack/anything/start/vim-leftmargin
cd ~/.config/nvim/pack/anything/start/vim-leftmargin
git clone https://github.com/jpaulogg/vim-leftmargin
git fetch origin pack
git checkout pack
```
