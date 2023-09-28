# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp .zshrc ~/.zshrc

# conda
sh -c "$(wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh)"
conda install -n base conda-libmamba-solver
conda config --set solver libmamba

# vim
cp .vimrc ~/.vimrc
