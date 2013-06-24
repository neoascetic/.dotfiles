all:
	# install vim from the ppa for the youcompleteme plugin
	sudo add-apt-repository -y ppa:nmi/vim-snapshots
	sudo apt-get update
	sudo apt-get -y install python-setuptools git vim zsh ack-grep exuberant-ctags grc
	# use 'ack' as command instead of 'ack-grep'
	sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
	# git
	make _link f=.gitconfig
	make _link f=.gitexclude
	make _link f=.git-template
	# submodules
	git submodule update --init --recursive
	# python stuff
	sudo easy_install pip
	sudo pip install virtualenvwrapper virtualenvwrapper.tmpenv bpython
	mkdir -p $(HOME)/.virtualenvs
	make _link f=.virtualenvs/* t=.virtualenvs
	# zsh
	# in most cases I run this script under user that do not have password
	# chsh -s /bin/zsh
	make _link f=.zsh
	make _link f=.zsh/rc.zsh t=.zshrc
	# vim
	mkdir -p $(HOME)/.vim/undodir
	make _link f=.vimrc
	# vundle-update call (antigen will be updated too since session is interactive)
	zsh -ic "vundle-update"
	# colorful mysql output
	make _link f=.my.cnf
	make _link f=.grcat

x11:
	sudo apt-get -y install i3 dmenu
	# bin
	make _link f=bin
	# i3
	make _link f=.i3
	# patched fonts for vim's powerline
	mkdir -p $(HOME)/.fonts/
	make _link f=.fonts/* t=.fonts

_link:
	ln -si $(CURDIR)/$(f) $(HOME)/$(t)
