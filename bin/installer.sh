#!/bin/sh

if [ ! "$(type git 2>/dev/null)" ]; then
    echo "$0: git not found"
    exit 1
fi

dotpath=~/.dotfiles
repository=https://github.com/bellflower2015/dotfiles.git

[ ! -d $dotpath ] && git clone $repository $dotpath
pushd $dotpath

for src in $dotpath/src/.??*; do
    dotfile=${src#$dotpath/src/}
    dst=~/$dotfile
    rm -rf $dst
    [ "$dotfile" = ".vim"        ] && cp -a $src $dst && continue
    [ "$dotfile" = ".vimrc.dein" ] && cp -a $src $dst && continue
    ln -snfv $src $dst
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" -- ~/.vim

popd