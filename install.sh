# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# recover the dotfiles
# https://news.ycombinator.com/item?id=11071754
git clone --separate-git-dir=$HOME/.myconf git@github.com/desmondlzy/.myconf.git $HOME/myconf-tmp
if [ -f ~/myconf-tmp/.gitsubmodules ]; then
	cp ~/myconf-tmp/.gitmodules ~
fi
rm -r ~/myconf-tmp
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

git config --global user.email "desmondzyliu@gmail.com"
git config --global user.name "Desmond Liu"

# oh my zsh
# https://ohmyz.sh/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# bunch of apps (casks), see ./Brewfile for list

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

brew bundle --file Brewfile

# conda
conda install --yes -n base conda-libmamba-solver
conda config --set solver libmamba
