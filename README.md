# Setup
## General
At work I use tcsh and can't do things like install fancy fonts. At home I use bash and can do any amount of mucking around.  In order to use the same set of dotfiles for both, set environmental variable `WORKENV=1` for a pared down and/or tcsh setup.

In bash
```
export WORKENV=1
```
In tcsh 
```
setenv WORKENV 1
```

## VIM
Before starting, make sure you create the `~/.vim/tmp/` directory for history and swap files
```
$ mkdir ~/.vim/tmp
```

We need to have Vundle installed, after that it will take care of other plugins
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Start vim
```
$ vim
```

You may get an error or two since the plugins haven't installed, but now run
```
:PluginInstall
```

to pull and install the plugins. Quit vim and restart and you should be good to go.
