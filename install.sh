# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# bunch of apps (casks)
brew install --cask \
	iterm2 \
	visual-studio-code \
	miniconda \
	inkscape \
	gimp \
	google-chrome \
	firefox \
	wechat \
	discord \
	whatsapp \
	onedrive \
	dropbox \
	zotero

brew install \
	wget \
	yt-dlp \
	thefuck \
	node \
	lazygit \
	nvim

# font install via homebrew
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

# oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# nvim
# https://lazyvim.org/installation
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp .zshrc ~/.zshrc

# conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba

# vim
cp .vimrc ~/.vimrc
