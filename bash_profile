# Add `~/bin` to the `$PATH`
export PATH="$HOME/.local/bin:$PATH";

export TERM="xterm-256color"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,bash_aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Set ls colors
if [ -f ~/.dircolors ]; then
    eval `dircolors -b ~/.dircolors`
fi

export GIT_EDITOR=vim

export EDITOR=vim
