for name in $(git diff --ignore-submodules --name-only $1); do git difftool $1 $name & done
