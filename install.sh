curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo "export PATH="$PATH:/opt/nvim-linux64/bin"" | tee -a ~/.bashrc
git clone -b nvim-dotfiles https://github.com/NoHaxito/dotfiles ~/.config/nvim 
rm -rf .git
rm -r ./install.sh
