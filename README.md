# MCvim

## installation
```
mkdir ~/.vim
cd ~/.vim
git clone https://github.com/melonCoder/MCvim
cd MCvim
chmod +x install.sh
./install.sh
```

# install vim with lua to support neocomplete
```
git clone https://github.com/vim/vim.git
sudo yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel ctags mercurial python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-luainterp --enable-gui=gtk2 --enable-cscope --with-tlib=ncurses --prefix=/usr
sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install
```
