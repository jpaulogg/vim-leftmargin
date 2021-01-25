# leftmargin.vim

Vim plugin that adds left margin to vim windows, making easier to read and write prose. I wrote
this script because I don't like the way the [goyo.vim](https://github.com/junegunn/goyo.vim/tree/master)
plugin handles windows and `statusline` (check [main differences](#main-differences) section). Also because
I like to keep things minimal.

## Should you use this plugin?

This plugin was written in an attempt to be simple enough that users could make any changes directly
to it. I believe that this gives users more control and a wider range of possible changes. In
addition, the script has comments that help to make some customizations (for example,
[hide the statusline](https://github.com/jpaulogg/vim-leftmargin/blob/293f7ba4955bffc492fd4c20569a537d61b1f47b/leftmargin.vim#L48-L51)
). It's almost as simple as doing it on your `vimrc`.

If you prefere something that provides global variables and options that you can set from
your `vimrc`, you should try [similar plugins](#similar-plugins).

## Commands and mappings

`:LeftMargin` adds left margin.

`:NoMargin` removes left margin.

`<leader>p` toggles left margin.

## Installation

Just copy leftmargin.vim to the "plugin" directory in your runtime. For example:

```
# in vim use '~/.vim/' instead of '~/.config/nvim'
curl -fLo ~/.config/nvim/plugin/vim-leftmargin/leftmargin.vim \
	https://raw.githubusercontent.com/jpaulogg/vim-leftmargin/master/leftmargin.vim
```

If you prefer, use (Neo)Vim's built-in package support.

```
# in vim use '~/.vim/' instead of '~/.config/nvim'
curl -fLo ~/.config/nvim/pack/any/start/vim-leftmargin/plugin/leftmargin.vim \
	--create-dirs \
	https://raw.githubusercontent.com/jpaulogg/vim-leftmargin/master/leftmargin.vim
```

## Similar plugins

- [Goyo](https://github.com/junegunn/goyo.vim/tree/master/)

- [vim-venter](https://github.com/JMcKiern/vim-venter)

- [mutton-vim](https://github.com/gabenespoli/vim-mutton)

### Main differences

- local to window (you can have windows with left margin and others without it);
- doesn't hide statusline by default (not difficult to [achieve](#should-you-use-this-plugin));
- doesn't create new windows to simulate margins;
- because of that, doesn't create a right margin;
- left margin has a 32 column width limit (`numberwidth + foldcolumn`)
- leftmargin.vim script has ~70 lines of code, while goyo.vim has ~390.

For more details, take a look at the script. It's very simple!

