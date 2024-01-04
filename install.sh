# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# recover the dotfiles
# https://news.ycombinator.com/item?id=11071754
git clone --separate-git-dir=$HOME/.myconf https://github.com/desmondlzy/.myconf $HOME/myconf-tmp
if [ -f ~/myconf-tmp/.gitsubmodules ]; then
	cp ~/myconf-tmp/.gitmodules ~
fi
rm -r ~/myconf-tmp
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# oh my zsh
# https://ohmyz.sh/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# bunch of apps (casks), see ./Brewfile for list

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

brew bundle --file Brewfile

# conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba
