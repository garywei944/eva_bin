#!/usr/bin/env bash

config_emacs() {
  [[ ${EVA+x} ]] || exit

  # Configure emacs
  rm -fr ~/.emacs.d ~/.spacemacs.d ~/.spacemacs ~/.spacemacs.env
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

  [[ ${NOSUDO+x} ]] && exit
  git clone git@github.com:garywei944/.spacemacs.d.git ~/.spacemacs.d


  cd /tmp || exit

  # Source Code Pro Font
  wget -O Source_Code_Pro.zip https://fonts.google.com/download?family=Source%20Code%20Pro
  mkdir -p ~/.fonts/Source_Code_Pro
  unzip Source_Code_Pro.zip -d ~/.fonts/Source_Code_Pro
  rm -f Source_Code_Pro.zip
  fc-cache -f

  # Install clojure
  curl -O https://download.clojure.org/install/linux-install-1.10.2.796.sh
  chmod +x linux-install-1.10.2.796.sh
  sudo ./linux-install-1.10.2.796.sh
  rm -f linux-install-1.10.2.796.sh

  # git clone git@github.com:practicalli/clojure-deps-edn.git ~/.clojure/

  # Packages
  sudo apt install -y rlwrap silversearcher-ag ripgrep fd-find locate aspell fonts-firacode ttf-ancient-fonts graphviz
  sudo npm install -g js-beautify prettier vscode-css-languageserver-bin vscode-html-languageserver-bin
}
