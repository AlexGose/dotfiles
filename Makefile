SHELL=/bin/bash
CWD:=${CURDIR}

.PHONY: all
all: git neovim psql tmux # Install all configuration files

.PHONY: git
git: # Install Git configuration files
	@ln -nsf ${CWD}/.gitconfig ~/.gitconfig 
	@ln -nsf ${CWD}/.gitignore ~/.gitignore

.PHONY: neovim
neovim: # Install Neovim configuration files
	@mkdir -p ~/.config/nvim
	@ln -nsf ${CWD}/init.vim ~/.config/nvim/init.vim
	@ln -nsf ${CWD}/.vimrc ~/.vimrc

.PHONY: psql
psql: # Install psql configuration file
	@ln -nsf ${CWD}/.psqlrc ~/.psqlrc

.PHONY: tmux
tmux: # Install Tmux configuration file
	@ln -nsf ${CWD}/.tmux.conf ~/.tmux.conf

