#!/bin/sh

mkdir /home/user/workspace &&
    git -C /home/user clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1 &&
    (cat > /home/user/.bashrc <<EOF
GIT_PROMPT_ONLY_IN_REPO=1
source /home/user/.bash-git-prompt/gitprompt.sh
EOF
    ) && 
    curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash &&
    mkdir /home/user/.ssh