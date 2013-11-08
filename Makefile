all:
	# install vim from the ppa for the youcompleteme plugin
	sudo add-apt-repository -y ppa:nmi/vim-snapshots
	sudo apt-get update
	sudo apt-get -y install python-setuptools git vim zsh ack-grep exuberant-ctags
	# use 'ack' as command instead of 'ack-grep'
	sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
	# git
	make _link f=.gitconfig
	make _link f=.gitexclude
	make _link f=.git-template
	# python stuff
	sudo easy_install pip
	sudo pip install virtualenvwrapper virtualenvwrapper.tmpenv bpython
	mkdir -p $(HOME)/.virtualenvs
	make _link f=.virtualenvs/* t=.virtualenvs
	# zsh
	# in most cases I run this script under user that do not have password
	# chsh -s /bin/zsh
	make _link f=.zshrc
	# vim
	mkdir -p $(HOME)/.vim/undodir
	make _link f=.vimrc
	# vundle-update call (antigen will be updated too since session is interactive)
	zsh -ic "vundle-update"
	# colorful mysql output
	make _link f=.my.cnf

x11:
	sudo apt-get -y install i3 dmenu
	make _link f=bin
	make _link f=.i3

_link:
	ln -si $(CURDIR)/$(f) $(HOME)/$(t)
