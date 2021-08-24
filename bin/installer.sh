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

if [ ! -f $dotpath/.git-completion.bash ]; then
    curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $dotpath/.git-completion.bash
fi

if [ ! -f $dotpath/.git-prompt.sh ]; then
    curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o $dotpath/.git-prompt.sh
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" -- ~/.vim

popd
