# leftmargin.vim

Vim plugin that adds left margin to terminal windows, making easier to read and write prose. I wrote
this script because I don't like the way the [goyo.vim](https://github.com/junegunn/goyo.vim/tree/master)
plugin handles windows and `statusline`. Also because I like to keep things minimal.

## Philosophy - should you use this plugin?

This plugin was written in an attempt to be simple enough that users could make any changes directly
to it. I believe that this gives users more control and a wider range of possible changes. In
addition, the script has comments that help to make some customizations (for example, hide the
`statusline`). It's almost as simple as doing it on your `vimrc`.

If you prefere something that provides global variables and options that you can set from
your `vimrc`, you should try [similar plugins](#similar-plugins).

## Commands and mappings

`:LeftMargin` adds left margin.

`:NoMargin` removes left margin.

`<leader>p` toggles left margin.

## Installation

Just copy leftmargin.vim to "plugin" directory in your runtime. For example:

```
# in vim use '~/.vim/' instead of '~/.config/nvim'
mkdir -p ~/.config/nvim/plugin/
cd ~/.config/nvim/plugin/
git clone https://github.com/jpaulogg/vim-leftmargin
rm -rf plugin/.git plugin/README.md
```

If you prefer, install using your favorite package manager, or use (Neo)Vim's built-in package
support. Use `pack` branch in that case:

```
# vim-plug
Plug 'jpaulogg/vim-leftmargin', { 'branch' : 'pack' }
:PlugInstall

# built-in package support (in vim use '~/.vim/' instead of '~/.config/nvim')
mkdir -p ~/.config/nvim/pack/anything/start/vim-leftmargin
cd ~/.config/nvim/pack/anything/start/vim-leftmargin
git clone https://github.com/jpaulogg/vim-leftmargin
git fetch origin pack
git checkout pack
```

## Similar plugins

- [Goyo](https://github.com/junegunn/goyo.vim/tree/master/)

- [vim-venter](https://github.com/JMcKiern/vim-venter)

- [mutton-vim](https://github.com/gabenespoli/vim-mutton)

### Main differences

- local to window (you can have windows with left margin and others without it);
- doesn't hide statusline by default (not difficult to [achieve](#philosophy---should-you-use-this-plugin));
- doesn't create new windows to simulate margins;
- because of that, doesn't create a right margin;
- left margin has a 32 column width limit (`numberwidth + foldcolumn`)
- leftmargin.vim script has ~70 lines of code, while goyo.vim has ~390.

For more details, take a look at the script. It's very simple!

