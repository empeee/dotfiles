# Setup
Notes about how to get to my working setup from scratch.
## General
At work I use tcsh and can't do things like install fancy fonts. At home I use bash and can do any amount of mucking around.  In order to use the same set of dotfiles for both, set environmental variable `WORKENV` for a pared down and/or tcsh setup.

In bash
```
export WORKENV=1
```
In tcsh
```
setenv WORKENV 1
```

## Vim
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

## Terminal colors
Most of the files here are setup to put things into 256 color mode, but even that is a very limited color set. I'm trying to standardize on solarized-dark, but it requires some manual interventions to use.
### Putty
In Windows, it requires some changes to each session to get solarized colors. This is most easily done in the registry editor with the included file `putty_solarized_dark.reg`.  Edit the file to include the session name you want to edit (or add a new session to use a starting point for others) and run the file to perform the edits.
### Konsole
Newer versions of Konsole have solarized built in, but older ones do not.  For older versions, I manually entered the colors from https://github.com/phiggins/konsole-colors-solarized
### Other
## Terminal Fonts
airline (and powerline) are awesome plugins for Vim, but the downside is that they require special font support to show special symbols.  In the pared down version of my scripts, with `WORKENV=1`, I try to get around this by using unicode characters in place, but even this doesn't work everywhere with every font.
