# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,bash_aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export GIT_EDITOR=vim
export EDITOR=vim
